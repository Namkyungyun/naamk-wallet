import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/config/route/app_router.dart';
import 'package:naamk_wallet/config/theme/app_theme.dart';
import 'package:naamk_wallet/config/theme/app_theme_state.dart';
import 'package:naamk_wallet/config/theme/app_theme_ui_model.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = AppRouter();
    final AppThemeUiModel currentTheme = ref.watch(appThemeLogicProvider);

    return MaterialApp.router(
      routerConfig: router.getGoRouter,
      title: "Naamk Wallet",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.themeMode,
    );
  }
}
