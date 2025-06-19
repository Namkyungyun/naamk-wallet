import 'package:flutter/material.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_theme_state.g.dart';

@Riverpod(keepAlive: true)
class AppThemeState extends _$AppThemeState {
  static const THEME_MODE = "themeMode";

  @override
  Future<ThemeMode> build() async {
    ThemeMode themeMode = ThemeMode.system;
    final prefs = injector<SharedPreferences>();
    final savedThemeMode = prefs.getString(THEME_MODE) ?? 'ThemeMode.system';

    themeMode = findThemeMode(savedThemeMode);
    return themeMode;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = injector<SharedPreferences>();
    await prefs.setString(THEME_MODE, mode.toString());
    await Future.delayed(const Duration(seconds: 5));
    state = AsyncValue.data(mode);
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
