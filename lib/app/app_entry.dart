import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/app_entry_viewmodel.dart';
import 'package:naamk_wallet/config/presentation/language/app_language.dart';
import 'package:naamk_wallet/config/presentation/language/app_language_state.dart';
import 'package:naamk_wallet/config/core/observer/app_lifecyle_observer.dart';
import 'package:naamk_wallet/config/presentation/theme/app_theme.dart';
import 'package:naamk_wallet/config/presentation/theme/app_theme_state.dart';
import 'package:easy_localization/easy_localization.dart';

class AppEntry extends ConsumerStatefulWidget {
  const AppEntry({super.key});

  @override
  ConsumerState<AppEntry> createState() => _AppEntryState();
}

class _AppEntryState extends ConsumerState<AppEntry> {
  late final AppEntryViewModel _state;
  late final AppLifecycleObserver _observer;

  @override
  void initState() {
    super.initState();

    _state = AppEntryViewModel();
    _state.onInit();

    _observer = AppLifecycleObserver(
      onStateChanged: _onAppLifecyleChanged,
    );

    // 최초 frame 렌더링 이후에 진행되도록.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _observer.start();
    });
  }

  void _onAppLifecyleChanged(AppLifecycleState state) {
    // 포그라운드 백그라운드 모드에 따라서 체크리스트가 필요한 경우 해당 파트에서 연결되도록 진행.

    if (state == AppLifecycleState.paused) {
      // Background 모드

      // 앱잠김 설정된 경우 앱잠김 설정으로 변경되게 하기

      // 안내 팝업에 대해서 매번 보여줘야하는 경우 해당 건 보여주기
    }

    if (state == AppLifecycleState.resumed) {
      // Foreground 모드

      // 앱점검

      // 앱버전 업그레이드

      // 앱잠금

      // 앱잠금 인증 후 pending된 딥링크 재개.
      _state.runPendingDeeplink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLanguage currentLanguage = ref.watch(appLanguageStateProvider);
    final AsyncValue<ThemeMode> themeAsync = ref.watch(appThemeStateProvider);

    return MaterialApp.router(
      routerConfig: _state.getRouter,
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
