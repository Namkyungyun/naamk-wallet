import 'package:naamk_wallet/config/core/local_storage/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_state.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_auth_state_manager.g.dart';

@Riverpod(keepAlive: true)
class AppAuthStateManager extends _$AppAuthStateManager {
  @override
  AppAuth build() {
    final String savedLockMode =
        SharedPreferencesManipulator.currentAppAuthMethod ??
            AppAuthMethod.pinOnly.name;

    final AppAuthMethod method = AppAuthMethod.getAppAuthMethod(savedLockMode);

    AppAuthStatus status = AppAuthStatus.idle;
    if (method != AppAuthMethod.none) {
      status = AppAuthStatus.required;
    }

    return AppAuth(method: method, status: status);
  }

  // lock mode 변경하기
  void setAppAuthMethod(String modeName) {
    final AppAuthMethod currentLockMode =
        AppAuthMethod.getAppAuthMethod(modeName);
    SharedPreferencesManipulator.setAppAuthStatus(currentLockMode.toString());

    state = state.copyWith(method: currentLockMode);
  }

  // lock status 변경하기
  void setAppAuthStatus(AppAuthStatus currentStatus) {
    state = state.copyWith(status: currentStatus);
  }
}
