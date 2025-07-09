import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/setting/widgets/setting_info_listtile_widget.dart';
import 'package:naamk_wallet/config/presentation/language/app_language.dart';
import 'package:naamk_wallet/config/presentation/language/app_language_state.dart';

class LanguageListSwitchWidget extends StatelessWidget {
  LanguageListSwitchWidget({super.key});

  // 전체 빌드가 일어나지 않고, ValueListenableBuilder 내부만 빌드가 일어나도록.
  final ValueNotifier<bool> _showLanguageCard = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        LanguageSwitchWidget(
          isShowing: _showLanguageCard,
          onTab: () => _showLanguageCard.value = !_showLanguageCard.value,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: _showLanguageCard,
          builder: (context, show, _) {
            return AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: ClipRect(
                child:
                    show ? const LanguageListWidget() : const SizedBox.shrink(),
              ),
            );
          },
        )
      ],
    );
  }
}

class LanguageSwitchWidget extends StatelessWidget {
  final ValueNotifier<bool> isShowing;
  final VoidCallback onTab;

  const LanguageSwitchWidget({
    super.key,
    required this.isShowing,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SettigInfoListTileWidget(
      leadingIcon: Icons.language,
      title: 'setting_page.list.language',
      onTap: onTab,
      trailingWidget: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor),
            child: Consumer(
              builder: (context, ref, _) {
                final AppLanguage languageModeState =
                    ref.watch(appLanguageStateProvider); // 전역 state관리

                return Text(
                  languageModeState.langCode,
                  style: TextStyle(
                    color: Theme.of(context).listTileTheme.selectedColor,
                  ),
                );
              },
            ),
          ),
          const Gap(4),
          ValueListenableBuilder<bool>(
            valueListenable: isShowing,
            builder: (context, show, _) {
              return AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: ClipRect(
                  child: Icon(
                    show ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    size: 28,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class LanguageListWidget extends StatelessWidget {
  const LanguageListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final AppLanguage languageModeState =
            ref.watch(appLanguageStateProvider); // 전역 state관리
        final lanuguageNotifier = ref.read(appLanguageStateProvider.notifier);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: AppLanguage.values
                    .map(
                      (item) => ListTile(
                        leading: Text(item.countryCode),
                        title: Text(item.langCode),
                        trailing: item.langCode == languageModeState.langCode
                            ? Icon(
                                Icons.check,
                                color: Theme.of(context).primaryColor,
                              )
                            : null,
                        onTap: () {
                          lanuguageNotifier.setLanguageMode(
                            context,
                            item.langCode,
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
