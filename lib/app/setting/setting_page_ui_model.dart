import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_page_ui_model.g.dart';
part 'setting_page_ui_model.freezed.dart';

@freezed
class SettingPageUiModel with _$SettingPageUiModel {
  const factory SettingPageUiModel({
    @Default(false) bool showLanguageCard,
  }) = _SettingPageUiModel;

  factory SettingPageUiModel.fromJson(Map<String, dynamic> json) =>
      _$SettingPageUiModelFromJson(json);
}
