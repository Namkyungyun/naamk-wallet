import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/app/app_entry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/config/presentation/language/app_language.dart';

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
      fallbackLocale: AppLanguage.getLocale(PlatformDispatcher
          .instance.locale.languageCode), // 초기 locale or device locale일 때 사용
      child: const ProviderScope(
        child: AppEntry(),
      ),
    ),
  );
}
