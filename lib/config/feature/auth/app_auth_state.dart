import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/config/feature/auth/app_auth_type.dart';

part 'app_auth_state.freezed.dart';

@freezed
class AppAuth with _$AppAuth {
  const factory AppAuth({
    @Default(AppAuthMethod.none) method,
    @Default(AppAuthStatus.idle) status,
  }) = _AppLock;
}
