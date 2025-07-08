import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naamk_wallet/config/core/local_storage/shared_preferences_manipulator.dart';
import 'package:naamk_wallet/config/presentation/language/app_language.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_language_state.g.dart';

@riverpod
class AppLanguageState extends _$AppLanguageState {
  @override
  AppLanguage build() {
    final String savedLanguageMode =
        SharedPreferencesManipulator.currentLanguage ??
            ''; // savedLanguageMode : 'AppLanguage.ko'

    AppLanguage languageMode = AppLanguage.getAppLanguage(savedLanguageMode);

    return languageMode;
  }

  // langCode : 'ko'
  void setLanguageMode(BuildContext context, String langCode) {
    final AppLanguage currentLanguage = AppLanguage.getAppLanguage(langCode);

    SharedPreferencesManipulator.setAppLanguage(currentLanguage.toString());

    final Locale currentLocale = AppLanguage.getLocale(langCode);
    context.setLocale(currentLocale);

    state = currentLanguage;
  }
}
