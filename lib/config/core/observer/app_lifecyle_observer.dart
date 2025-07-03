import 'package:flutter/widgets.dart';

typedef AppLifecycleCallback = void Function(AppLifecycleState state);

class AppLifecycleObserver with WidgetsBindingObserver {
  final AppLifecycleCallback onStateChanged;

  AppLifecycleObserver({required this.onStateChanged});

  void start() => WidgetsBinding.instance.addObserver(this);
  void stop() => WidgetsBinding.instance.removeObserver(this);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    onStateChanged(state);
  }
}
