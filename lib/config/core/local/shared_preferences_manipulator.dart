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

  // app auth method
  static const String AUTH_METHOD = 'authMethod';
  static String? get currentAppAuthMethod => prefs.getString(AUTH_METHOD);
  static Future<void> setAppAuthStatus(String newValue) =>
      prefs.setString(AUTH_METHOD, newValue);

  // use app lock
  static const APP_LOCK = 'appLock';
  static bool get useAppLock => prefs.getBool(APP_LOCK) ?? false;
  static Future<void> setUseAppLock(bool use) => prefs.setBool(APP_LOCK, use);
}
