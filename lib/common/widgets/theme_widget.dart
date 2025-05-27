import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/config/theme/app_theme_state.dart';

class ThemeWidget extends ConsumerWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            tr('toggle_theme'),
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(fontWeightDelta: 2),
          ),
        ),
        const Spacer(),
        SegmentedButton<ThemeMode>(
          showSelectedIcon: false,
          selected: <ThemeMode>{ref.watch(appThemeLogicProvider).themeMode},
          segments: const <ButtonSegment<ThemeMode>>[
            ButtonSegment<ThemeMode>(
              icon: Icon(Icons.light_mode_outlined),
              value: ThemeMode.light,
            ),
            ButtonSegment<ThemeMode>(
              icon: Icon(Icons.portrait_outlined),
              value: ThemeMode.system,
            ),
            ButtonSegment<ThemeMode>(
              icon: Icon(Icons.dark_mode_outlined),
              value: ThemeMode.dark,
            ),
          ],
          onSelectionChanged: (Set<ThemeMode> theme) => ref
              .read(appThemeLogicProvider.notifier)
              .setThemeMode(theme.first),
        ),
      ],
    );
  }
}
