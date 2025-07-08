import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/app_entry_listener.dart';
import 'package:naamk_wallet/app/app_entry_viewmodel.dart';
import 'package:naamk_wallet/config/presentation/language/app_language.dart';
import 'package:naamk_wallet/config/presentation/language/app_language_state.dart';
import 'package:naamk_wallet/config/presentation/theme/app_theme.dart';
import 'package:naamk_wallet/config/presentation/theme/app_theme_state.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class AppEntry extends ConsumerWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLanguage currentLanguage = ref.watch(appLanguageStateProvider);
    final AsyncValue<ThemeMode> themeAsync = ref.watch(appThemeStateProvider);

    return MaterialApp.router(
      routerConfig: ref.watch(appEntryViewModelProvider.notifier).getRouter,
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
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            const AppEntryStatusListener(),
          ],
        );
      },
    );
  }
}
