import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

enum AppLanguage {
  ko('ko', 'KR'),
  en('en', 'US'),
  ;

  final String langCode;
  final String countryCode;
  const AppLanguage(this.langCode, this.countryCode);

  static const String localizationPath = 'assets/languages';

  static AppLanguage getAppLanguage(String langCode) {
    if (langCode.isNotEmpty) {
      langCode = langCode.replaceAll('AppLanguage.', '');
    }

    List<AppLanguage> all = AppLanguage.values;

    return all.firstWhereOrNull((lang) => lang.langCode == langCode) ??
        AppLanguage.ko;
  }

  static List<Locale> getAllLocale() {
    List<AppLanguage> all = AppLanguage.values;
    return all.map((lang) => Locale(lang.langCode, lang.countryCode)).toList();
  }

  static Locale getLocale(String langCode) {
    AppLanguage findOne = getAppLanguage(langCode);
    return Locale(findOne.langCode, findOne.countryCode);
  }
}
