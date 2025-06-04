import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/config/language/app_language.dart';
import 'package:naamk_wallet/config/language/app_language_state.dart';

class LanguageSwitchWidget extends HookConsumerWidget {
  const LanguageSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageMode = ref.watch(appLanguageStateProvider).languageMode;
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
                    trailing: item.langCode == languageMode.langCode
                        ? Icon(
                            Icons.check,
                            color: Theme.of(context).primaryColor,
                          )
                        : null,
                    onTap: () {
                      lanuguageNotifier.setLanguageMode(context, item.langCode);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
