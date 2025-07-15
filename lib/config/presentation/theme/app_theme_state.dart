import 'package:flutter/material.dart';
import 'package:naamk_wallet/config/core/local/shared_preferences_manipulator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_theme_state.g.dart';

@Riverpod(keepAlive: true)
class AppThemeState extends _$AppThemeState {
  @override
  Future<ThemeMode> build() async {
    ThemeMode themeMode = ThemeMode.system;

    final savedThemeMode = SharedPreferencesManipulator.currentAppThemeMode ??
        ThemeMode.system.toString();

    themeMode = findThemeMode(savedThemeMode);
    return themeMode;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await SharedPreferencesManipulator.setAppThemeMode(mode.toString());
    await Future.delayed(const Duration(seconds: 2));
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
