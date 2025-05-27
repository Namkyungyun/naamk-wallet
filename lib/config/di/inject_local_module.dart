import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injector.dart';

Future<void> registerLocalModule() async {
  await registerSharedPreferences();
  await registerFlutterHive();
}

/// 목록
Future<void> registerSharedPreferences() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  injector.registerSingleton<SharedPreferences>(sharedPrefs);
}

Future<void> registerFlutterHive() async {
  final Directory tmpDir = await getTemporaryDirectory();
  await Hive.initFlutter(tmpDir.toString());
  await Hive.openBox<String>('prefs');
}
