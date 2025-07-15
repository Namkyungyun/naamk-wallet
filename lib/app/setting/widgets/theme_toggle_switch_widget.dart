import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/app/setting/widgets/setting_info_listtile_widget.dart';
import 'package:naamk_wallet/common/widgets/global_loading_widget/global_overay_loading.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:naamk_wallet/config/presentation/theme/app_theme_state.dart';

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

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return SettigInfoListTileWidget(
      leadingIcon: Icons.brightness_6,
      title: 'setting_page.list.theme',
      trailingWidget: Consumer(
        builder: (context, ref, _) {
          final ThemeMode? themeMode = ref.watch(appThemeStateProvider).value;
          final themeNotifier = ref.read(appThemeStateProvider.notifier);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ToggleSwitch(
              minWidth: 80.0,
              initialLabelIndex: switch (themeMode!) {
                ThemeMode.light => 0,
                ThemeMode.dark => 1,
                ThemeMode.system => 2,
              },
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
              onToggle: (index) async {
                if (index == null) return;
                final mode = switch (index) {
                  0 => ThemeMode.light,
                  1 => ThemeMode.dark,
                  _ => ThemeMode.system,
                };

                GlobalLoadingService.showOverlayLoading();
                await themeNotifier.setThemeMode(mode);
                GlobalLoadingService.hideOverlayLoading();
              },
            ),
          );
        },
      ),
    );
  }
}
