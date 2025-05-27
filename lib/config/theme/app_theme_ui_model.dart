import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_ui_model.freezed.dart';
part 'app_theme_ui_model.g.dart';

@freezed
class AppThemeUiModel with _$AppThemeUiModel {
  const factory AppThemeUiModel({
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppThemeUiModel;

  factory AppThemeUiModel.fromJson(Map<String, dynamic> json) =>
      _$AppThemeUiModelFromJson(json);
}
