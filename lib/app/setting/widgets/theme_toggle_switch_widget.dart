import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:naamk_wallet/config/theme/app_theme_state.dart';

class ThemeToggleSwitch extends HookConsumerWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeStateProvider).themeMode;
    final themeNotifier = ref.read(appThemeStateProvider.notifier);

    final List<String> toggleLabels = [
      'Light',
      'Dark',
      'System',
    ];
    final List<IconData> toggleIcons = [
      Icons.light_mode,
      Icons.dark_mode,
      Icons.settings,
    ];

    // 현재 테마를 index로 변환
    int currentIndex = switch (themeMode) {
      ThemeMode.light => 0,
      ThemeMode.dark => 1,
      ThemeMode.system => 2,
    };

    return ListTile(
      leading: const Icon(
        Icons.brightness_6,
        size: 24,
      ),
      trailing: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ToggleSwitch(
          minWidth: 80.0,
          initialLabelIndex: currentIndex,
          cornerRadius: 8.0,
          totalSwitches: 3,
          labels: toggleLabels,
          customTextStyles: toggleLabels
              .map<TextStyle>((el) => const TextStyle(fontSize: 10))
              .toList(),
          icons: toggleIcons,
          inactiveBgColor: Theme.of(context).cardColor,
          activeBgColor: toggleLabels
              .map<Color>((el) => Theme.of(context).primaryColor)
              .toList(),
          onToggle: (index) {
            if (index == null) return;
            final mode = switch (index) {
              0 => ThemeMode.light,
              1 => ThemeMode.dark,
              _ => ThemeMode.system,
            };
            themeNotifier.setThemeMode(mode);
          },
        ),
      ),
    );
  }
}
