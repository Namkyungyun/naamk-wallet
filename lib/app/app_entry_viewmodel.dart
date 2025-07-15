import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/core/local/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/core/remote/viewmodel_base_apihandler.dart';
import 'package:naamk_wallet/config/feature/deeplink/entry_handler.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/route/app_router.dart';
import 'package:naamk_wallet/remote/common/states/view_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/app_maintenance_state.dart';
import 'package:naamk_wallet/remote/system/states/feature_state/login_session_state.dart';
import 'package:naamk_wallet/remote/system/states/screen_state/app_entry_state.dart';
import 'package:naamk_wallet/remote/usecases/system_usecases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_entry_viewmodel.g.dart';

enum AppEntryCheckStatus {
  none,
  checkingMaintenance,
  checkingForceUpdate,
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
  ViewState<AppMaintenanceState> get appMaintenanceState =>
      state.appMaintenanceRes;
  // ViewState<AppForceUpdateState> get appForceUpdateState =>
  //     state.appForceUpdateRes;

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
    GlobalLogger.info("[AppEntryCheckStatus] checkAppMaintenance ");
    AppEntryCheckStatus? result;

    await executeApiCall(
        request: _domain.checkAppMaintenance.call(req: null),
        onLoading: () {},
        onSuccess: (featureState) {
          final AppMaintenanceState newState = featureState;

          state = state.copyWith(
              appMaintenanceRes: appMaintenanceState.toComplete(newState));

          result = (newState.isMaintenance)
              ? AppEntryCheckStatus.checkingMaintenance
              : null;
        },
        onError: (exception) {
          result = AppEntryCheckStatus.checkingMaintenance;
          state = state.copyWith(
              appMaintenanceRes: appMaintenanceState.toError(exception));
        });
    return result;
  }

  // 2. 앱 강제 업데이트 여부 확인
  Future<AppEntryCheckStatus?> checkAppVersionUpdate() async {
    GlobalLogger.info("[AppEntryCheckStatus] checkAppVersion ");
    AppEntryCheckStatus? result;

    // await executeApiCall(
    //     request: _domain.checkAppForeeUpdate.call(),
    //     onLoading: () {},
    //     onSuccess: (featureState) {
    //       final AppForeceUpdateState newState = featureState;

    //       state = state.copyWith(
    //           appForceUpdateRes: appForceUpdateState.toComplete(newState));

    //       result = (newState.isForce)
    //           ? AppEntryCheckStatus.checkingForceUpdate
    //           : null;
    //     },
    //     onError: (exception) {
    //       result = AppEntryCheckStatus.checkingForceUpdate;
    //     });

    return result;
  }

  // 3. 로그인 세션 만료
  Future<AppEntryCheckStatus?> checkUserLoginSession() async {
    GlobalLogger.info("[AppEntryCheckStatus] checkLoginSession ");
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
          result = AppEntryCheckStatus.checkingLoginSession;
          state = state.copyWith(
              userLoginSessionRes: userLoginSessionState.toError(exception));
        });
    return result;
  }

  // 4. app 잠김상태 확인
  Future<AppEntryCheckStatus?> checkAppLock() async {
    GlobalLogger.info("[AppEntryCheckStatus] checkAppLock ");

    final bool savedUseAppLock = SharedPreferencesManipulator.useAppLock;

    return savedUseAppLock ? AppEntryCheckStatus.applock : null;
  }
}
