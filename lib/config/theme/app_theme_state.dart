import 'package:flutter/material.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.g.dart';

@riverpod
class AppThemeState extends _$AppThemeState {
  static const THEME_MODE = "themeMode";

  @override
  ThemeMode build() {
    ThemeMode themeMode = ThemeMode.system;
    final prefs = injector<SharedPreferences>();
    final savedThemeMode = prefs.getString(THEME_MODE) ?? 'ThemeMode.system';

    themeMode = findThemeMode(savedThemeMode);
    return themeMode;
  }

  void setThemeMode(ThemeMode mode) {
    final prefs = injector<SharedPreferences>();
    prefs.setString(THEME_MODE, mode.toString());

    state = mode;
  }

  void toggleTheme() {
    if (state == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }

  ThemeMode findThemeMode(String mode) {
    return switch (mode) {
      'ThemeMode.dark' => ThemeMode.dark,
      'ThemeMode.light' => ThemeMode.light,
      'ThemeMode.system' => ThemeMode.system,
      (_) => ThemeMode.system
    };
  }
}
