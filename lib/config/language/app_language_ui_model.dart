import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/config/language/app_language.dart';

part 'app_language_ui_model.freezed.dart';
part 'app_language_ui_model.g.dart';

@freezed
class AppLanguageUiModel with _$AppLanguageUiModel {
  const factory AppLanguageUiModel({
    @Default(AppLanguage.ko) AppLanguage languageMode,
  }) = _AppLanguageUiModel;

  factory AppLanguageUiModel.fromJson(Map<String, dynamic> json) =>
      _$AppLanguageUiModelFromJson(json);
}
