import 'dart:io';

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injector.dart';

Future<void> registerLocalModule() async {
  await registerSharedPreferences();
  await registerFlutterHive();
  await registerPreferredOrientations();
}

// 앱 orientation 조정
Future<void> registerPreferredOrientations() async {
  try {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  } catch (e) {
    // TODO logger 심기
  }
}

/// 간단한 String, int, boolean 정보의 로컬 데이터 저장소로 사용
Future<void> registerSharedPreferences() async {
  try {
    final sharedPrefs = await SharedPreferences.getInstance();
    injector.registerSingleton<SharedPreferences>(sharedPrefs);
  } catch (e) {
    // TODO logger 심기
  }
}

// List, Object와 같은 로컬 데이터 저장소로 사용
Future<void> registerFlutterHive() async {
  try {
    final Directory tmpDir = await getTemporaryDirectory();
    await Hive.initFlutter(tmpDir.toString());
    await Hive.openBox<String>('prefs');
  } catch (e) {
    // TODO logger 심기
  }
}
