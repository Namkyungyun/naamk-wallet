import 'package:naamk_wallet/config/feature/%08deeplink/entry_handler.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/route/app_router.dart';

class AppEntryViewModel {
  late final AppRouter _appRouter;
  // 앱 최초 열렸을 때에 체크
  void onInit() {
    _initAppRouter();
    _initDeeplinkListener();
  }

  // background로 내려갈 경우 처리
  void onBackground() {
    // 앱 잠김이 설정되어져 있는 경우에서 flag update필요
    // 동작하고 있던 이벤트 로직 멈추게 하기?
  }

  // foreground되어질 때마다 처리
  void onForeground() {
    // 앱 잠김이 설정되어져 있는 경우에서의 flag 감지로 앱잠김 화면 보여지도록 동작.
    // 멈춰있는 이벤트 로직 동작되게 하기?
  }

  /// router
  void _initAppRouter() {
    _appRouter = injector<AppRouter>();
  }

  GoRouter get getRouter => _appRouter.getGoRouter;

  /// deeplink
  void _initDeeplinkListener() {
    DeeplinkEntryHandler.init(getRouter);
  }

  void runPendingDeeplink() {
    DeeplinkEntryHandler.consumePendingDeeplink();
  }

  // 버전 체크 및 앱 점검 체크 진행
}
