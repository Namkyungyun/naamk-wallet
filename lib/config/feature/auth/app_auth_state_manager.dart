import 'package:naamk_wallet/config/core/local/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_auth_state_manager.g.dart';

@Riverpod(keepAlive: true)
class AppAuthStateManager extends _$AppAuthStateManager {
  @override
  AppAuthState build() {
    final bool savedAuthLockStatus = SharedPreferencesManipulator.useAppLock;

    final String savedAuthMethod =
        SharedPreferencesManipulator.currentAppAuthMethod ??
            AppAuthMethod.none.name;

    final AppAuthMethod method =
        AppAuthMethod.getAppAuthMethod(savedAuthMethod);

    AppAuthStatus status = AppAuthStatus.idle;
    if (method != AppAuthMethod.none) {
      status = AppAuthStatus.required;
    }

    return AppAuthState(
        useLock: savedAuthLockStatus, method: method, status: status);
  }

  // 앱 잠금 여부 변경하기
  void setUseAppLock(bool use) {
    SharedPreferencesManipulator.setUseAppLock(use);

    state = state.copyWith(useLock: use);
  }

  // auth method 변경하기
  void setAppAuthMethod(String modeName) {
    final AppAuthMethod currentLockMode =
        AppAuthMethod.getAppAuthMethod(modeName);
    SharedPreferencesManipulator.setAppAuthStatus(currentLockMode.toString());

    state = state.copyWith(method: currentLockMode);
  }

  // auth status 변경하기
  void setAppAuthStatus(AppAuthStatus currentStatus) {
    state = state.copyWith(status: currentStatus);
  }
}
