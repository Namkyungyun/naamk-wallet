import 'package:collection/collection.dart';
import 'package:naamk_wallet/common/utils/logger.dart';

enum AppAuthMethod {
  none,
  pinOnly,
  biometric,
  ;

  String get name => toString().replaceAll('AuthMethod.', '');

  static AppAuthMethod getAppAuthMethod(String name) {
    final AppAuthMethod? mode =
        AppAuthMethod.values.firstWhereOrNull((el) => el.name == name);

    if (mode == null) {
      GlobalLogger.error('No AuthMethod by name : $name');
      return AppAuthMethod.none;
    }

    return mode;
  }
}

enum AppAuthStatus {
  idle, // 기본 상태
  required, // 인증 필요
  verifying, // 인증 시도 중
  success, // 인증 성공
  failed, // 인증 실패
  permanentlyLocked, // ❗완전히 잠긴 상태 (재시도 제한 등) -> 완전 잠금을 나타내는 화면 (재로그인 필요 안내)
}
