import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception_state.freezed.dart';

@freezed
class AppExceptionState with _$AppExceptionState {
  const factory AppExceptionState({
    @Default(false) show,
    @Default('') code,
    @Default('') message,
    @Default('') detailMessage,
  }) = _AppExceptionState;
}
