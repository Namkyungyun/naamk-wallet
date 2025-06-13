import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_screen_ui_model.g.dart';
part 'setting_screen_ui_model.freezed.dart';

@freezed
class SettingScreenUiModel with _$SettingScreenUiModel {
  const factory SettingScreenUiModel({
    @Default(false) bool showLanguageCard,
  }) = _SettingPageUiModel;

  factory SettingScreenUiModel.fromJson(Map<String, dynamic> json) =>
      _$SettingScreenUiModelFromJson(json);
}
