import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:naamk_wallet/config/theme/app_theme_state.dart';

class ThemeToggleSwitch extends HookConsumerWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeLogicProvider).themeMode;
    final themeNotifier = ref.read(appThemeLogicProvider.notifier);

    // 현재 테마를 index로 변환
    int currentIndex = switch (themeMode) {
      ThemeMode.light => 0,
      ThemeMode.system => 1,
      ThemeMode.dark => 2,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        leading: const Icon(
          Icons.brightness_6,
          size: 24,
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ToggleSwitch(
            minWidth: 90.0,
            initialLabelIndex: currentIndex,
            cornerRadius: 8.0,
            activeBgColors: [
              [Colors.blueGrey.shade300],
              [Colors.blueGrey.shade300],
              [Colors.grey.shade800],
            ],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey.shade200,
            inactiveFgColor: Colors.black,
            totalSwitches: 3,
            labels: const ['Light', 'System', 'Dark'],
            icons: const [Icons.light_mode, Icons.settings, Icons.dark_mode],
            onToggle: (index) {
              if (index == null) return;
              final mode = switch (index) {
                0 => ThemeMode.light,
                1 => ThemeMode.system,
                2 => ThemeMode.dark,
                _ => ThemeMode.system,
              };
              themeNotifier.setThemeMode(mode);
            },
          ),
        ),
      ),
    );
  }
}
