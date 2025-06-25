import 'package:app_links/app_links.dart';
import 'package:naamk_wallet/common/%08deeplink/handler_factory.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/config/route/app_route_path.dart';
import 'package:collection/collection.dart';

class DeeplinkEntryHandler {
  static late GoRouter _router;

  static void init(GoRouter router) {
    // go_router 등록
    _router = router;

    // deepLink lib di 조회
    final appLinks = injector.get<AppLinks>();

    appLinks.uriLinkStream.listen((uri) {
      handleUri(uri);
    });

    appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        handleUri(uri);
      }
    });
  }

  static void handleUri(Uri uri) {
    GlobalLogger.info('deeplink in : $uri');

    const String scheme = 'naamk';
    const String host = 'com.naamk.walletapp';

    // scheme 체크
    if (!(uri.hasScheme && uri.scheme == scheme)) {
      showInvalidRequestMessage('scheme: ${uri.scheme}');
      return;
    }

    // host 체크
    if (!(uri.host == host)) {
      showInvalidRequestMessage('host: ${uri.host}');
      return;
    }

    // path별 분기처리
    final List<String> path = uri.pathSegments.toList();
    if (path.isEmpty) {
      showInvalidRequestMessage('path is empty');
      return;
    }

    AppGnbRoute? gnbRoute =
        AppGnbRoute.values.firstWhereOrNull((el) => el.name == path.first);
    final Map<String, dynamic> params = uri.queryParameters;

    final handler =
        DeeplinkHandlerFactory.create(gnbRoute, _router, path, params);
    if (handler == null) {
      showInvalidRequestMessage(
          'not found requested gnb route : ${gnbRoute?.route}');
      return;
    }

    handler.handle();
  }

  static showInvalidRequestMessage(String message) {
    GlobalLogger.error('deeplink error : Invalid Request : $message');
  }
}
