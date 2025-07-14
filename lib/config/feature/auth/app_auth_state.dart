import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';

part 'app_auth_state.freezed.dart';

@freezed
class AppAuthState with _$AppAuthState {
  const factory AppAuthState({
    @Default(false) useLock,
    @Default(AppAuthMethod.none) method,
    @Default(AppAuthStatus.idle) status,
  }) = _AppAuthState;
}
