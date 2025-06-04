import 'package:naamk_wallet/app/setting/setting_page_state.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/setting/widgets/language_switch_list_widget.dart';
import 'package:naamk_wallet/app/setting/widgets/theme_toggle_switch_widget.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';
import 'package:naamk_wallet/config/language/app_language_state.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageState = ref.watch(appLanguageStateProvider).languageMode;

    final pageState = ref.watch(settingPageStateProvider);
    final pageStateNotifier = ref.read(settingPageStateProvider.notifier);

    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 64.0, 8.0, 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('page_title.setting'),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Gap(16),
                const ThemeToggleSwitch(),
                const Gap(8),
                SettigListInfoItem(
                  leadingIcon: Icons.language,
                  trailingWidget: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).primaryColor),
                    child: Text(
                      languageState.langCode,
                      style: TextStyle(
                        color: Theme.of(context).listTileTheme.selectedColor,
                      ),
                    ),
                  ),
                  title: context.tr('setting_page.list.language'),
                  onTap: () {
                    pageStateNotifier
                        .setShowLanguageCard(!pageState.showLanguageCard);
                  },
                ),
                if (pageState.showLanguageCard) const LanguageSwitchWidget(),
                const Gap(8),
                SettigListPushItem(
                  icon: Icons.person,
                  title: context.tr('setting_page.list.about'),
                  onTap: () {},
                ),
                const Gap(8),
                SettigListPushItem(
                  icon: Icons.logout,
                  title: context.tr('setting_page.list.logout'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettigListPushItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const SettigListPushItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 4.0), // 아이콘과 텍스트 간격
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class SettigListInfoItem extends StatelessWidget {
  final IconData leadingIcon;
  final Widget trailingWidget;
  final String title;
  final VoidCallback? onTap;

  const SettigListInfoItem({
    super.key,
    required this.leadingIcon,
    required this.trailingWidget,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: 24,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 4.0), // 아이콘과 텍스트 간격
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      trailing: trailingWidget,
      onTap: onTap,
    );
  }
}
