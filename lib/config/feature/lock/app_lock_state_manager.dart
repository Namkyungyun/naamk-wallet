import 'package:naamk_wallet/config/core/local_storage/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/feature/lock/app_lock_state.dart';
import 'package:naamk_wallet/config/feature/lock/app_lock_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lock_state_manager.g.dart';

@Riverpod(keepAlive: true)
class AppLockStateManager extends _$AppLockStateManager {
  @override
  AppLock build() {
    final String savedLockMode =
        SharedPreferencesManipulator.currentAppLockMode ??
            AppLockMode.pinOnly.name;

    final AppLockMode lockMode = AppLockMode.getAppLockMode(savedLockMode);

    AppLockStatus status = AppLockStatus.unlocked;
    if (lockMode != AppLockMode.none) {
      status = AppLockStatus.lockedRequired;
    }

    return AppLock(lockMode: lockMode, lockStatus: status);
  }

  // lock mode 변경하기
  void setAppLockMode(String modeName) {
    final AppLockMode currentLockMode = AppLockMode.getAppLockMode(modeName);
    SharedPreferencesManipulator.setAppLockMode(currentLockMode.toString());

    state = state.copyWith(lockMode: currentLockMode);
  }

  // lock status 변경하기
  void setAppLockStatus(AppLockStatus currentStatus) {
    state = state.copyWith(lockStatus: currentStatus);
  }
}
