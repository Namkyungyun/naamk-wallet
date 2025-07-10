import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/core/local/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/feature/deeplink/entry_handler.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/route/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_entry_viewmodel.g.dart';

enum AppEntryCheckStatus {
  initial,
  checkingMaintenance,
  checkingUpdate,
  checkingAppLock,
  applock,
  handlingDeeplink,
  completed,
}

@riverpod
class AppEntryViewModel extends _$AppEntryViewModel {
  /// router
  final AppRouter _appRouter = injector<AppRouter>();
  GoRouter get getRouter => _appRouter.getGoRouter;

  @override
  AppEntryCheckStatus build() {
    return AppEntryCheckStatus.initial;
  }

  void setEntryCheckStatus(AppEntryCheckStatus status) {
    state = status;
  }

  // 앱 최초 열렸을 때에 체크
  void onInit() {
    _initDeeplinkListener();
    runAppEntryCheckList();
  }

  /// deeplink
  void _initDeeplinkListener() {
    DeeplinkEntryHandler.init(getRouter);
  }

  void runPendingDeeplink() {
    DeeplinkEntryHandler.consumePendingDeeplink();
  }

  /// 앱 점검 리스트
  Future<void> runAppEntryCheckList() async {
    AppEntryCheckStatus? showStatus;

    showStatus ??= await checkAppMaintenance();

    showStatus ??= await checkAppVersionUpdate();

    // 앱잠김 확인
    showStatus ??= await checkAppLock();

    // 딥링크 재개
    if (showStatus == null) {
      runPendingDeeplink();
    }

    state = (showStatus != null) ? showStatus : AppEntryCheckStatus.completed;

    GlobalLogger.info('[runAppEntryCheckList] showStatus: $showStatus');
  }

  // 1. 앱 점검 중 확인
  Future<AppEntryCheckStatus?> checkAppMaintenance() async {
    GlobalLogger.info("[checkAppMaintenance] Start ");
    final result = await Future.delayed(const Duration(seconds: 2), () {
      // return AppEntryCheckStatus.checkingMaintenance;
      return null;
    });
    GlobalLogger.info("[checkAppMaintenance] Complete");

    return result;
  }

  // 2. 앱 강제 업데이트 여부 확인
  Future<AppEntryCheckStatus?> checkAppVersionUpdate() async {
    GlobalLogger.info("[checkAppVersion] Start ");
    final result = await Future.delayed(const Duration(seconds: 2), () {
      // return AppEntryCheckStatus.checkingUpdate;
      return null;
    });
    GlobalLogger.info("[checkAppVersion] Complete");

    return result;
  }

  // 3. app 잠김상태 확인
  Future<AppEntryCheckStatus?> checkAppLock() async {
    GlobalLogger.info('[checkAppLock] Start');

    final bool savedUseAppLock = SharedPreferencesManipulator.useAppLock;

    GlobalLogger.info('[checkAppLock] Complete');

    return savedUseAppLock ? AppEntryCheckStatus.applock : null;
  }
}
