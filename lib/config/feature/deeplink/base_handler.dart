import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';

abstract class DeeplinkBaseHandler {
  final GoRouter router;
  final List<String> path;
  final Map<String, dynamic> params;

  DeeplinkBaseHandler(this.router, this.path, this.params);

  void handle() {
    final String? versionRaw = params['version'];
    final double? version = double.tryParse(versionRaw ?? '');

    switch (version) {
      case 1.0:
        handleV1();
        break;
      default:
        showUnsupportedVersionMesasge(versionRaw ?? 'null');
        return;
    }
  }

  void handleV1() {
    GlobalLogger.info('deeplink processing in handleV1');

    // gnb 탭 변경
    final String gnbTabPath = '/${path.first}';
    router.go(gnbTabPath);

    // 상세 페이지가 있다면 열기
    if (path.length > 1) {
      final String fullPath = '/${path.join('/')}';

      // Set캐싱
      final Set<String> detailRoutes =
          AppRoute.values.map<String>((el) => el.route).toSet();

      if (detailRoutes.contains(fullPath)) {
        router.push(fullPath);
      } else {
        showNotfoundMessage(fullPath);
      }
    }
  }

  void showUnsupportedVersionMesasge(String message) {
    GlobalLogger.error('deeplink error : Unsupported Version : $message');
  }

  void showNotfoundMessage(String message) {
    GlobalLogger.error('deeplink error : Not found page : $message');
  }
}
