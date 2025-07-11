import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception_state.freezed.dart';

@freezed
class AppException with _$AppException {
  const factory AppException({
    @Default(false) show,
    @Default('') code,
    @Default('') message,
    @Default('') detailMessage,
  }) = _AppError;
}
