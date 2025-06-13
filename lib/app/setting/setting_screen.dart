import 'package:naamk_wallet/app/setting/widgets/lanugae_list_switch_widget.dart';
import 'package:naamk_wallet/app/setting/widgets/setting_push_listtile_widget.dart';
import 'package:naamk_wallet/common/widgets/title_appbar_widget.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:gap/gap.dart';
import 'package:naamk_wallet/app/setting/widgets/theme_toggle_switch_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppbarWidget(title: 'page_title.setting'.tr()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ThemeToggleSwitch(),
                const Gap(8),
                const LanguageListSwitchWidget(),
                const Gap(8),
                SettigPushListTileWidget(
                  icon: Icons.person,
                  title: 'setting_page.list.about'.tr(),
                  onTap: () {},
                ),
                const Gap(8),
                SettigPushListTileWidget(
                  icon: Icons.logout,
                  title: 'setting_page.list.logout'.tr(),
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
