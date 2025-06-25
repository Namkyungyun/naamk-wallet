import 'package:naamk_wallet/common/%08deeplink/handler/event_handler.dart';
import 'package:naamk_wallet/common/%08deeplink/handler/home_handler.dart';
import 'package:naamk_wallet/common/%08deeplink/handler/notice_handler.dart';
import 'package:naamk_wallet/common/%08deeplink/handler/setting_handler.dart';
import 'package:naamk_wallet/common/%08deeplink/base_handler.dart';
import 'package:naamk_wallet/common/%08deeplink/handler/wallet_handler.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/config/route/app_route_path.dart';

typedef DeeplinkHandlerBuilder = DeeplinkBaseHandler Function(
  GoRouter router,
  List<String> path,
  Map<String, dynamic> params,
);

class DeeplinkHandlerFactory {
  static final Map<AppGnbRoute, DeeplinkHandlerBuilder> _handler = {
    AppGnbRoute.notices: (router, path, params) =>
        DeeplinkNoticeHandler(router, path, params),
    AppGnbRoute.wallet: (router, path, params) =>
        DeeplinkWalletHandler(router, path, params),
    AppGnbRoute.home: (router, path, params) =>
        DeeplinkHomeHandler(router, path, params),
    AppGnbRoute.events: (router, path, params) =>
        DeeplinkEventHandler(router, path, params),
    AppGnbRoute.settings: (router, path, params) =>
        DeeplinkSettingHandler(router, path, params),
  };

  static DeeplinkBaseHandler? create(
    AppGnbRoute? route,
    GoRouter router,
    List<String> path,
    Map<String, dynamic> params,
  ) {
    if (route == null || !_handler.containsKey(route)) return null;
    return _handler[route]!(router, path, params);
  }
}
