import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/setting/widgets/setting_info_listtile_widget.dart';
import 'package:naamk_wallet/config/presentation/language/app_language.dart';
import 'package:naamk_wallet/config/presentation/language/app_language_state.dart';

class LanguageListSwitchWidget extends HookConsumerWidget {
  const LanguageListSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<bool> showLanguageCard = useState(false); // 지역 state 관리

    return Consumer(builder: (context, ref, _) {
      final AppLanguage languageModeState =
          ref.watch(appLanguageStateProvider); // 전역 state관리
      final lanuguageNotifier = ref.read(appLanguageStateProvider.notifier);

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SettigInfoListTileWidget(
            leadingIcon: Icons.language,
            trailingWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).primaryColor),
              child: Text(
                languageModeState.langCode,
                style: TextStyle(
                  color: Theme.of(context).listTileTheme.selectedColor,
                ),
              ),
            ),
            title: 'setting_page.list.language'.tr(),
            onTap: () => showLanguageCard.value = !showLanguageCard.value,
          ),
          if (showLanguageCard.value)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: AppLanguage.values
                        .map(
                          (item) => ListTile(
                            leading: Text(item.countryCode),
                            title: Text(item.langCode),
                            trailing:
                                item.langCode == languageModeState.langCode
                                    ? Icon(
                                        Icons.check,
                                        color: Theme.of(context).primaryColor,
                                      )
                                    : null,
                            onTap: () {
                              lanuguageNotifier.setLanguageMode(
                                  context, item.langCode);
                            },
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}
