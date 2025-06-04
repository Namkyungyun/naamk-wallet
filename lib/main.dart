import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/app/root_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/config/language/app_language.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  // di할 객체 주입
  await initializeDependencies();

  FlutterNativeSplash.remove();

  runApp(
    EasyLocalization(
      supportedLocales: AppLanguage.getAllLocale(),
      path: AppLanguage.localizationPath,
      fallbackLocale: AppLanguage.getLocale(''),
      child: const ProviderScope(
        // riverpod context pool 안에서 ui 요소가 들어가도록.
        child: RootScreen(),
      ),
    ),
  );
}
