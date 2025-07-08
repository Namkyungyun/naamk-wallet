import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

final SharedPreferences prefs = injector<SharedPreferences>();

class SharedPreferencesManipulator {
  // appTheme
  static const String THEME_MODE = "themeMode";
  static String? get currentAppThemeMode => prefs.getString(THEME_MODE);
  static Future<void> setAppThemeMode(String newValue) =>
      prefs.setString(THEME_MODE, newValue);

  // appLanguage
  static const String LANG_MODE = 'languageMode';
  static String? get currentLanguage => prefs.getString(LANG_MODE);
  static Future<void> setAppLanguage(String newValue) =>
      prefs.setString(LANG_MODE, newValue);

  // applock
  static const String LOCK_MODE = 'lockMode';
  static String? get currentAppLockMode => prefs.getString(LOCK_MODE);
  static Future<void> setAppLockMode(String newValue) =>
      prefs.setString(LOCK_MODE, newValue);
}
