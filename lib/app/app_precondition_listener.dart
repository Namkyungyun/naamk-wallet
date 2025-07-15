import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/app/app_precondition_router.dart';
import 'package:naamk_wallet/app/app_entry_viewmodel.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';
import 'package:naamk_wallet/common/widgets/global_loading_widget/global_loading_dot_widget.dart';
import 'package:naamk_wallet/config/core/applifecycle/app_lifecyle_observer.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state_manager.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state_manager.dart';
import 'package:naamk_wallet/remote/common/states/view_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_maintenance_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';
import 'package:naamk_wallet/remote/system/states/screen_state/app_entry_state.dart';

class AppPreconditionListener extends ConsumerStatefulWidget {
  const AppPreconditionListener({super.key});

  @override
  ConsumerState<AppPreconditionListener> createState() =>
      _AppEntryStatusListener();
}

class _AppEntryStatusListener extends ConsumerState<AppPreconditionListener>
    with AppPreconditionRouter {
  late final ProviderSubscription<AppEntryState>? _appEntrySubscription;
  late final AppLifecycleObserver? _appLifeCycleObserver;

  final _lockThreshold = const Duration(seconds: 5);
  bool _initialized = false;
  bool _showInitUi = true;

  DateTime? _lastPausedTime;
  DateTime? _lastResumeTime;

  // function 전용
  AppEntryViewModel get _appEntryLogic =>
      ref.watch<AppEntryViewModel>(appEntryViewModelProvider.notifier);

  AppAuthState get _appAuthState =>
      ref.watch<AppAuthState>(appAuthStateManagerProvider);
  AppAuthStateManager get _appAuthLogic => ref.watch<AppAuthStateManager>(
      appAuthStateManagerProvider.notifier); // 최신 상태를 읽기위해서는 read를 사용해야 함.

  @override
  void dispose() {
    _appEntrySubscription?.close();
    super.dispose();
  }

  /// appLifecycle observer 등록 ///////////////
  @override
  void initState() {
    super.initState();

    _appLifeCycleObserver = AppLifecycleObserver(
      onStateChanged: (AppLifecycleState state) async {
        // Background 모드
        if (state == AppLifecycleState.paused) {
          // 앱잠김 설정된 경우 앱잠김 설정으로 변경되게 하기
          if (_initialized) {
            if (_appAuthState.useLock) {
              _lastPausedTime = DateTime.now();
            }
          }
        }

        // Foreground 모드
        if (state == AppLifecycleState.resumed) {
          // 포그라운드마다 check
          if (_initialized) {
            if (_appAuthState.useLock) {
              _lastResumeTime = DateTime.now();
            }
            _showInitUi = false;
            _appEntryLogic.setEntryCheckStatus(AppEntryCheckStatus.none);
          }
          _appEntryLogic.runAppEntryCheckList(!_showInitUi);
        }
      },
    );

    // 최초 frame 렌더링 이후에 진행되도록.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appEntryLogic.onInit();
      _appLifeCycleObserver?.start();
    });
  }

  /// app entry check listener 등록 ///////////////
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;

      // Frame 이후 안전하게 context 사용
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _appEntrySubscription = ref.listenManual<AppEntryState>(
          appEntryViewModelProvider,
          (prev, next) async {
            GlobalLogger.info(
                '[precondition state] ${prev?.appEntryStatus} → ${next.appEntryStatus}');
            final prevAppEntryStatus = prev?.appEntryStatus;
            final currentAppEntryStatus = next.appEntryStatus;

            if (currentAppEntryStatus ==
                AppEntryCheckStatus.checkingMaintenance) {
              final ViewState<AppMaintenanceState> viewState =
                  next.appMaintenanceRes;

              final ResponseStatus responseStatus = viewState.state;

              switch (responseStatus) {
                case ResponseStatus.COMPLETE:
                  // 세션 끊겼을 때 연결
                  await showAppMaintenance();
                case ResponseStatus.ERROR:
                  // 에러 연결
                  Future.microtask(() {
                    ref
                        .read(appErrorStateManagerProvider.notifier)
                        .showError(viewState.exception);
                  });
                default:
                  return;
              }
            }

            if (currentAppEntryStatus ==
                AppEntryCheckStatus.checkingForceUpdate) {
              await showAppForceUpdate();
              return;
            }

            if (currentAppEntryStatus ==
                AppEntryCheckStatus.checkingLoginSession) {
              final ViewState<LoginSessionState> viewState =
                  next.userLoginSessionRes;

              final ResponseStatus responseStatus = viewState.state;

              switch (responseStatus) {
                case ResponseStatus.COMPLETE:
                  // 세션 끊겼을 때 연결
                  await showLoginSessionExpired();
                case ResponseStatus.ERROR:
                  // 에러 연결
                  Future.microtask(() {
                    ref
                        .read(appErrorStateManagerProvider.notifier)
                        .showError(viewState.exception);
                  });
                default:
                  return;
              }
            }

            // 다른 상태 처리도 동일하게
            if (currentAppEntryStatus == AppEntryCheckStatus.applock) {
              final AppAuthStatus status =
                  await _isLockRequiredAfterResume(prevAppEntryStatus);

              if (status == AppAuthStatus.required && mounted) {
                await showAppAuth();

                // 앱락 해제
                _appAuthLogic.setAppAuthStatus(AppAuthStatus.idle);

                // entry status 변경
                _appEntryLogic
                    .setEntryCheckStatus(AppEntryCheckStatus.handlingDeeplink);
              }

              if (status == AppAuthStatus.idle) {
                //완료후 deeplink 처리되도록 상태변경
                _appEntryLogic
                    .setEntryCheckStatus(AppEntryCheckStatus.handlingDeeplink);
              }
              return;
            }

            if (currentAppEntryStatus == AppEntryCheckStatus.handlingDeeplink) {
              _appEntryLogic.runPendingDeeplink(!_showInitUi);
              _appEntryLogic.setEntryCheckStatus(AppEntryCheckStatus.completed);
              return;
            }
          },
        );
      });
    }
  }

  Future<AppAuthStatus> _isLockRequiredAfterResume(
      AppEntryCheckStatus? prevEntryStatus) async {
    if (_appAuthState.useLock) {
      // 이미 잠금화면이 켜져있는 상태
      if (_appAuthState.status == AppAuthStatus.verifying) {
        return AppAuthStatus.verifying;
      }

      // 앱 첫 기동
      if (prevEntryStatus == AppEntryCheckStatus.none) {
        return AppAuthStatus.required;
      }

      // 앱잠금 상태 변경
      final bool shouldLock = _lastPausedTime != null &&
          _lastResumeTime != null &&
          _lastResumeTime!.difference(_lastPausedTime!) > _lockThreshold;

      _lastPausedTime = null;
      _lastResumeTime = null;

      // 일정 시간 내에 다시 포그라운드 모드될 경우 앱잠금 안됨.
      _appAuthLogic.setAppAuthStatus(
          shouldLock ? AppAuthStatus.required : AppAuthStatus.idle);

      return _appAuthState.status;
    }

    return AppAuthStatus.idle;
  }

  @override
  Widget build(BuildContext context) {
    final AppEntryCheckStatus status =
        ref.watch<AppEntryState>(appEntryViewModelProvider).appEntryStatus;

    if (!_showInitUi && status == AppEntryCheckStatus.none) {
      // 로딩 화면
      return Scaffold(
        appBar: const EmptyAppbarWidget(),
        backgroundColor: Theme.of(context).shadowColor,
        body: Center(
          child: GlobalLoadingDotWidget(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
          ),
        ),
      );
    }

    return const SizedBox.shrink(); // UI 없음
  }
}
