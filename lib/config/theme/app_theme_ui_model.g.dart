// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppThemeUiModelImpl _$$AppThemeUiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppThemeUiModelImpl(
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
    );

Map<String, dynamic> _$$AppThemeUiModelImplToJson(
        _$AppThemeUiModelImpl instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
