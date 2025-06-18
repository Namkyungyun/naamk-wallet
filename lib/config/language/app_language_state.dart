import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/config/language/app_language.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_language_state.g.dart';

@riverpod
class AppLanguageState extends _$AppLanguageState {
  static const LANG_MODE = 'languageMode';

  @override
  AppLanguage build() {
    final prefs = injector<SharedPreferences>();
    final String savedLanguageMode = prefs.getString(LANG_MODE) ??
        ''; // savedLanguageMode : 'AppLanguage.ko'

    AppLanguage languageMode = AppLanguage.getAppLanguage(savedLanguageMode);

    return languageMode;
  }

  // langCode : 'ko'
  void setLanguageMode(BuildContext context, String langCode) {
    final AppLanguage currentLanguage = AppLanguage.getAppLanguage(langCode);

    final prefs = injector<SharedPreferences>();
    prefs.setString(LANG_MODE, currentLanguage.toString()); // 'AppLanguage.ko'

    final Locale currentLocale = AppLanguage.getLocale(langCode);
    context.setLocale(currentLocale);

    state = currentLanguage;
  }
}
