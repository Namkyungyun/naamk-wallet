import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/config/di/strings.dart';
import 'package:naamk_wallet/app/root_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  // di할 객체 주입
  await initializeDependencies();

  FlutterNativeSplash.remove();

  // 앱 실행될 때 우선적으로 'portraitUp'으로 설정된 후 앱 실행되도록 하기
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: const <Locale>[
          /// Add your supported locales here
          Locale('en'),
          Locale('tr'),
        ],
        path: Strings.localizationsPath,
        fallbackLocale: const Locale('en', ''),
        child: const ProviderScope(
          child: RootScreen(),
        ),
      ),
    );
  });
}
