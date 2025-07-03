import 'package:collection/collection.dart';
import 'package:naamk_wallet/common/utils/logger.dart';

enum AppLockMode {
  none,
  pinOnly,
  biometric,
  ;

  String get name => toString().replaceAll('AppLockMode.', '');

  static AppLockMode getAppLockMode(String name) {
    final AppLockMode? mode =
        AppLockMode.values.firstWhereOrNull((el) => el.name == name);

    if (mode == null) {
      GlobalLogger.error('No AppLockMode by name : $name');
      return AppLockMode.none;
    }

    return mode;
  }
}

enum AppLockStatus {
  unlocked, // 잠금 해제된 상태
  lockedRequired, // 앱에 잠금이 요구되는 상태 (백그라운드로 앱모드가 변경되었을 때,)
  locking, // 잠금 중 (인증 대기)
  unlocking, // 인증 시도 중
  unlockedByAuth, // 인증 성공
  unlockFailed, // 인증 실패 (재시도 가능)
  permanentlyLocked, // ❗완전히 잠긴 상태 (재시도 제한 등) -> 완전 잠금을 나타내는 화면 (재로그인 필요 안내)
}
