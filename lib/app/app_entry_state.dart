import 'package:naamk_wallet/common/%08deeplink/entry_handler.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/config/route/app_router.dart';

class AppEntryState {
  AppRouter? _appRouter;
// class AppEntryState extends $AppEntryState {
  // 앱 최초 열렸을 때에 체크
  void onInit() {
    _initAppRouter();
    _initDeeplinkListener();
    // 앱 점검 중 체크
    // 앱 버전 업 필요 체크
    // 딥링크로 들어온 요청 전달
  }

  // background로 내려갈 경우 처리
  void onBackgroundApp() {
    // 앱 잠김이 설정되어져 있는 경우에서 flag update필요
    // 동작하고 있던 이벤트 로직 멈추게 하기?
  }

  // foreground되어질 때마다 처리
  void onForegroundApp() {
    // 앱 잠김이 설정되어져 있는 경우에서의 flag 감지로 앱잠김 화면 보여지도록 동작.
    // 멈춰있는 이벤트 로직 동작되게 하기?
  }

  /// router
  void _initAppRouter() {
    _appRouter = injector<AppRouter>();
  }

  GoRouter get getRouter => _appRouter!.getGoRouter;

  /// deeplink
  void _initDeeplinkListener() {
    if (_appRouter != null) {
      DeeplinkEntryHandler.init(getRouter);
    }
  }
}
