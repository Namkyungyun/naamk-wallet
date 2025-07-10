import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_error_state.freezed.dart';

@freezed
class AppError with _$AppError {
  const factory AppError({
    @Default(false) show,
    @Default('') code,
    @Default('') message,
  }) = _AppError;
}
