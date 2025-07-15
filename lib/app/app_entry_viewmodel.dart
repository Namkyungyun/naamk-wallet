import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/core/local/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/core/remote/viewmodel_base_apihandler.dart';
import 'package:naamk_wallet/config/feature/deeplink/entry_handler.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/route/app_router.dart';
import 'package:naamk_wallet/remote/common/states/view_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';
import 'package:naamk_wallet/remote/system/states/screen_state/app_entry_state.dart';
import 'package:naamk_wallet/remote/usecases/system_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_entry_viewmodel.g.dart';

enum AppEntryCheckStatus {
  none,
  checkingMaintenance,
  checkingUpdate,
  checkingAppLock,
  checkingLoginSession,
  applock,
  handlingDeeplink,
  completed,
}

@riverpod
class AppEntryViewModel extends _$AppEntryViewModel
    with ViewModelBaseApiHandler {
  late final SystemUsecases _domain = injector<SystemUsecases>();

  /// router
  final AppRouter _appRouter = injector<AppRouter>();
  GoRouter get getRouter => _appRouter.getGoRouter;

  /// state data
  AppEntryCheckStatus get appEntryStatus => state.appEntryStatus;
  String get userLoginSessionReq => state.userLoginSessionReq;
  ViewState<LoginSessionState> get userLoginSessionState =>
      state.userLoginSessionRes;

  @override
  AppEntryState build() {
    return AppEntryState.initial();
  }

  void setEntryCheckStatus(AppEntryCheckStatus status) {
    state = state.copyWith(appEntryStatus: status);
  }

  // 앱 최초 열렸을 때에 체크
  void onInit() {
    _initDeeplinkListener();
    runAppEntryCheckList(false);
  }

  /// deeplink
  void _initDeeplinkListener() {
    DeeplinkEntryHandler.init(getRouter);
  }

  void runPendingDeeplink(bool initialized) {
    final bool exist = DeeplinkEntryHandler.existPendingDeeplink;
    if (exist) {
      DeeplinkEntryHandler.consumePendingDeeplink();
    } else {
      if (!initialized) {
        getRouter.go(AppGnbRoute.home.route);
      }
    }
  }

  /// 앱 점검 리스트
  Future<void> runAppEntryCheckList(bool initialized) async {
    AppEntryCheckStatus? showStatus;

    showStatus ??= await checkAppMaintenance();

    showStatus ??= await checkAppVersionUpdate();

    showStatus ??= await checkUserLoginSession();

    // 앱잠김 확인
    showStatus ??= await checkAppLock();

    // 딥링크 재개
    if (showStatus == null) {
      runPendingDeeplink(initialized);
    }

    state = state.copyWith(
        appEntryStatus:
            (showStatus != null) ? showStatus : AppEntryCheckStatus.completed);

    GlobalLogger.info('[runAppEntryCheckList] showStatus: $showStatus');
  }

  // 1. 앱 점검 중 확인
  Future<AppEntryCheckStatus?> checkAppMaintenance() async {
    GlobalLogger.info("[checkAppMaintenance] Start ");
    final result = await Future.delayed(const Duration(seconds: 1), () {
      // return AppEntryCheckStatus.checkingMaintenance;
      return null;
    });
    GlobalLogger.info("[checkAppMaintenance] Complete");

    return result;
  }

  // 2. 앱 강제 업데이트 여부 확인
  Future<AppEntryCheckStatus?> checkAppVersionUpdate() async {
    GlobalLogger.info("[checkAppVersion] Start ");
    final result = await Future.delayed(const Duration(seconds: 1), () {
      // return AppEntryCheckStatus.checkingUpdate;
      return null;
    });
    GlobalLogger.info("[checkAppVersion] Complete");

    return result;
  }

  // 3. 로그인 세션 만료
  Future<AppEntryCheckStatus?> checkUserLoginSession() async {
    GlobalLogger.info("[checkLoginSession] Start");
    AppEntryCheckStatus? result;
    // api connect
    await executeApiCall(
        request: _domain.getUserLoginSession.call(req: 'testest123'),
        onLoading: () {},
        onSuccess: (featureState) {
          final LoginSessionState newState = featureState;

          state = state.copyWith(
              userLoginSessionRes: userLoginSessionState.toComplete(newState));

          result = (newState.sessionExpired)
              ? AppEntryCheckStatus.checkingLoginSession
              : null;
        },
        onError: (exception) {
          GlobalLogger.info(
              'confirm !!! : userLoginSessionState + $userLoginSessionState');
          result = AppEntryCheckStatus.checkingLoginSession;
          state = state.copyWith(
              userLoginSessionRes: userLoginSessionState.toError(exception));
        });

    GlobalLogger.info("[checkLoginSession] Complete");

    return result;
  }

  // 4. app 잠김상태 확인
  Future<AppEntryCheckStatus?> checkAppLock() async {
    GlobalLogger.info('[checkAppLock] Start');

    final bool savedUseAppLock = SharedPreferencesManipulator.useAppLock;

    GlobalLogger.info('[checkAppLock] Complete');

    return savedUseAppLock ? AppEntryCheckStatus.applock : null;
  }
}
