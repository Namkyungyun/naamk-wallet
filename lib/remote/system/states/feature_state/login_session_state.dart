import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_session_state.g.dart';
part 'login_session_state.freezed.dart';

@freezed
class LoginSessionState with _$LoginSessionState {
  const factory LoginSessionState({
    @Default('') String userId,
    @Default(false) bool sessionExpired,
  }) = _LoginSessionState;

  factory LoginSessionState.fromJson(Map<String, dynamic> json) =>
      _$LoginSessionStateFromJson(json);
}
