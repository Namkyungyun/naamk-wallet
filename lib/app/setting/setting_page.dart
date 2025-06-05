import 'package:naamk_wallet/app/setting/widgets/lanugae_list_switch_widget.dart';
import 'package:naamk_wallet/app/setting/widgets/setting_push_listtile_widget.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:gap/gap.dart';
import 'package:naamk_wallet/app/setting/widgets/theme_toggle_switch_widget.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                const LanguageListSwitchWidget(),
                const Gap(8),
                SettigPushListTileWidget(
                  icon: Icons.person,
                  title: context.tr('setting_page.list.about'),
                  onTap: () {},
                ),
                const Gap(8),
                SettigPushListTileWidget(
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
