import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/app/app_entry_listener_ui.dart';
import 'package:naamk_wallet/app/app_entry_viewmodel.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/core/observer/app_lifecyle_observer.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state_manager.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';

class AppEntryStatusListener extends ConsumerStatefulWidget {
  const AppEntryStatusListener({super.key});

  @override
  ConsumerState<AppEntryStatusListener> createState() =>
      _AppEntryStatusListener();
}

class _AppEntryStatusListener extends ConsumerState<AppEntryStatusListener>
    with AppEntryListenerUI {
  late final ProviderSubscription<AppEntryCheckStatus>? _appEntrySubscription;
  late final AppLifecycleObserver? _appLifeCycleObserver;

  final _lockThreshold = const Duration(seconds: 5);
  bool _initialized = false;

  DateTime? _lastPausedTime;
  DateTime? _lastResumeTime;

  // function 전용
  AppEntryViewModel get _appEntryLogic =>
      ref.watch<AppEntryViewModel>(appEntryViewModelProvider.notifier);

  AppAuth get _appLockState => ref.watch(appLockStateManagerProvider);
  AppAuthStateManager get _appLockLogic => ref.watch<AppAuthStateManager>(
      appLockStateManagerProvider.notifier); // 최신 상태를 읽기위해서는 read를 사용해야 함.

  @override
  void dispose() {
    _appEntrySubscription?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // UI 없음
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
          if (_appLockState.method != AppAuthMethod.none) {
            if (_initialized) {
              _lastPausedTime = DateTime.now();
            }
          }
        }

        // Foreground 모드
        if (state == AppLifecycleState.resumed) {
          // 포그라운드마다 check
          if (_initialized) {
            _lastResumeTime = DateTime.now();
            _appEntryLogic.runAppEntryCheckList();
          }
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
        _appEntrySubscription = ref.listenManual<AppEntryCheckStatus>(
          appEntryViewModelProvider,
          (prev, next) async {
            GlobalLogger.info('[listenManual] $prev → $next');

            if (next == AppEntryCheckStatus.checkingMaintenance) {
              await showAppMaintenance();
              return;
            }

            if (next == AppEntryCheckStatus.checkingUpdate) {
              await showAppForceUpdate();
              return;
            }

            // 다른 상태 처리도 동일하게
            if (next == AppEntryCheckStatus.applock) {
              final AppAuthStatus status =
                  await _isLockRequiredAfterResume(prev);

              if (status == AppAuthStatus.required && mounted) {
                await showAppAuth();

                // 앱락 해제
                _appLockLogic.setAppAuthStatus(AppAuthStatus.idle);

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

            if (next == AppEntryCheckStatus.handlingDeeplink) {
              _appEntryLogic.runPendingDeeplink();
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
    if (_appLockState.method != AppAuthMethod.none) {
      // 이미 잠금화면이 켜져있는 상태
      if (_appLockState.status == AppAuthStatus.verifying) {
        return AppAuthStatus.verifying;
      }

      // 앱 첫 기동
      if (prevEntryStatus == AppEntryCheckStatus.initial) {
        return AppAuthStatus.required;
      }

      // 앱잠금 상태 변경
      final bool shouldLock = _lastPausedTime != null &&
          _lastResumeTime != null &&
          _lastResumeTime!.difference(_lastPausedTime!) > _lockThreshold;

      _lastPausedTime = null;
      _lastResumeTime = null;

      // 일정 시간 내에 다시 포그라운드 모드될 경우 앱잠금 안됨.
      _appLockLogic.setAppAuthStatus(
          shouldLock ? AppAuthStatus.required : AppAuthStatus.idle);

      return _appLockState.status;
    }

    return AppAuthStatus.idle;
  }
}
