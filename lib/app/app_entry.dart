import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/config/language/app_language.dart';
import 'package:naamk_wallet/config/language/app_language_state.dart';
import 'package:naamk_wallet/config/route/app_router.dart';
import 'package:naamk_wallet/config/theme/app_theme.dart';
import 'package:naamk_wallet/config/theme/app_theme_state.dart';
import 'package:easy_localization/easy_localization.dart';

class AppEntry extends ConsumerWidget {
  const AppEntry({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter router = injector<AppRouter>();

    final AppLanguage currentLanguage = ref.watch(appLanguageStateProvider);

    final AsyncValue<ThemeMode> themeAsync = ref.watch(appThemeStateProvider);
    final ThemeMode themeMode = themeAsync.maybeWhen(
      data: (mode) => mode,
      orElse: () => ThemeMode.system,
    );

    return MaterialApp.router(
      routerConfig: router.getGoRouter,
      title: 'Naamk Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: AppLanguage.getLocale(currentLanguage.langCode),
    );
  }
}
