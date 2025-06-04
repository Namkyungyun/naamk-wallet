// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_language_ui_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppLanguageUiModelImpl _$$AppLanguageUiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppLanguageUiModelImpl(
      languageMode:
          $enumDecodeNullable(_$AppLanguageEnumMap, json['languageMode']) ??
              AppLanguage.ko,
    );

Map<String, dynamic> _$$AppLanguageUiModelImplToJson(
        _$AppLanguageUiModelImpl instance) =>
    <String, dynamic>{
      'languageMode': _$AppLanguageEnumMap[instance.languageMode]!,
    };

const _$AppLanguageEnumMap = {
  AppLanguage.ko: 'ko',
  AppLanguage.en: 'en',
};
