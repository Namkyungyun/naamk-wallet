import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/app_entry_state.dart';
import 'package:naamk_wallet/config/language/app_language.dart';
import 'package:naamk_wallet/config/language/app_language_state.dart';
import 'package:naamk_wallet/config/theme/app_theme.dart';
import 'package:naamk_wallet/config/theme/app_theme_state.dart';
import 'package:easy_localization/easy_localization.dart';

class AppEntry extends ConsumerStatefulWidget {
  const AppEntry({super.key});

  @override
  ConsumerState<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends ConsumerState<AppEntry> {
  late final AppEntryState state;

  @override
  void initState() {
    super.initState();

    state = AppEntryState();
    state.onInit();
  }

  @override
  Widget build(BuildContext context) {
    final AppLanguage currentLanguage = ref.watch(appLanguageStateProvider);
    final AsyncValue<ThemeMode> themeAsync = ref.watch(appThemeStateProvider);

    return MaterialApp.router(
      routerConfig: state.getRouter,
      title: 'Naamk Wallet',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeAsync.maybeWhen(
        data: (mode) => mode,
        orElse: () => ThemeMode.system,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: AppLanguage.getLocale(currentLanguage.langCode),
    );
  }
}
