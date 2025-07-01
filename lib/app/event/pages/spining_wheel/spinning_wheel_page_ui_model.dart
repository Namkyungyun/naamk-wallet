import 'package:freezed_annotation/freezed_annotation.dart';

part 'spinning_wheel_page_ui_model.g.dart';
part 'spinning_wheel_page_ui_model.freezed.dart';

@freezed
class SpinningWheelUiModel with _$SpinningWheelUiModel {
  const factory SpinningWheelUiModel({
    required double angle,
    String? selectedItem,
  }) = _SpinningWheelUiModel;

  factory SpinningWheelUiModel.fromJson(Map<String, dynamic> json) =>
      _$SpinningWheelUiModelFromJson(json);
}
