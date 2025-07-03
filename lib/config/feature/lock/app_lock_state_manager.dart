import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/feature/lock/app_lock_state.dart';
import 'package:naamk_wallet/config/feature/lock/app_lock_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_lock_state_manager.g.dart';

@riverpod
class AppLockStateManager extends _$AppLockStateManager {
  final LOCK_MODE = 'lockMode';
  final prefs = injector<SharedPreferences>();

  @override
  AppLock build() {
    final String savedLockMode =
        prefs.getString(LOCK_MODE) ?? AppLockMode.pinOnly.name;

    final AppLockMode lockMode = AppLockMode.getAppLockMode(savedLockMode);

    // late final AppLockStatus status;
    // if (lockMode != AppLockMode.none) {
    //   status = AppLockStatus.lockedRequired;
    // }

    return AppLock(lockMode: lockMode);
  }

  // lock mode 변경하기
  void setAppLockMode(String modeName) {
    final AppLockMode currentLockMode = AppLockMode.getAppLockMode(modeName);
    prefs.setString(LOCK_MODE, currentLockMode.toString());

    state = state.copyWith(lockMode: currentLockMode);
  }

  // lock status 변경하기
  void setAppLockStatus(AppLockStatus currentStatus) {
    state = state.copyWith(lockStatus: currentStatus);
  }
}
