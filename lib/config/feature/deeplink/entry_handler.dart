import 'package:app_links/app_links.dart';
import 'package:naamk_wallet/config/feature/deeplink/handler_factory.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';
import 'package:collection/collection.dart';

class DeeplinkEntryHandler {
  static late GoRouter _router;
  static Uri? _pendingDeeplink;

  static void init(GoRouter router) {
    // go_router 주입
    _router = router;

    // deepLink lib di로 주입된 AppLinks
    final appLinks = injector.get<AppLinks>();

    // AppLinks listener 등록
    appLinks.uriLinkStream.listen((uri) {
      _onDeeplinkReceived(uri);
    });

    appLinks.getInitialLink().then((uri) {
      if (uri != null) {
        _onDeeplinkReceived(uri);
      }
    });
  }

  static void _onDeeplinkReceived(Uri uri) {
    GlobalLogger.info('Deeplink received and stored: $uri');
    _pendingDeeplink = uri;
  }

  static void consumePendingDeeplink() {
    if (_pendingDeeplink == null) return;

    final Uri uri = _pendingDeeplink!;
    _pendingDeeplink = null;

    _handleUri(uri);
  }

  static void _handleUri(Uri uri) {
    final isCorrect = _isCorrectSchemeAndHost(uri);

    if (isCorrect) {
      // path별 분기처리
      final List<String> path = uri.pathSegments.toList();
      if (path.isEmpty) {
        _showInvalidRequestMessage('path is empty');
        return;
      }

      // 해당 uri 화면이 속한 gnb route 찾기
      AppGnbRoute? gnbRoute =
          AppGnbRoute.values.firstWhereOrNull((el) => el.name == path.first);
      final Map<String, dynamic> params = uri.queryParameters;

      // gnb handler create
      final handler =
          DeeplinkHandlerFactory.create(gnbRoute, _router, path, params);

      if (handler == null) {
        _showInvalidRequestMessage(
            'not found requested gnb route : ${gnbRoute?.route}');
        return;
      }

      // deeplink uri에 따른 화면 이동 로직 실행
      GlobalLogger.info('Deeplink`s handler processing...');
      handler.handle();
    }
  }

  static bool _isCorrectSchemeAndHost(Uri uri) {
    GlobalLogger.info('Deeplink`s scheme and host checking...');

    bool isCorrect = true;

    const String scheme = 'naamk';
    const String host = 'com.naamk.walletapp';

    // scheme 체크
    if (!(uri.hasScheme && uri.scheme == scheme)) {
      _showInvalidRequestMessage('scheme: ${uri.scheme}');
      isCorrect = false;
    }

    // host 체크
    if (!(uri.host == host)) {
      _showInvalidRequestMessage('host: ${uri.host}');
      isCorrect = false;
    }

    return isCorrect;
  }

  static _showInvalidRequestMessage(String message) {
    GlobalLogger.error('Deeplink error!: Invalid Request > $message');
  }
}
