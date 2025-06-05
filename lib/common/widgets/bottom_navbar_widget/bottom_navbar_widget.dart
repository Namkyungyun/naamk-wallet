import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/app/setting/setting_page.dart';
import 'package:naamk_wallet/common/widgets/bottom_navbar_widget/bottom_navbar_state.dart';
import 'package:naamk_wallet/config/theme/app_color.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavbarWidget extends ConsumerWidget {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavState = ref.watch(bottomNavbarStateProvider);

    final controller = PersistentTabController(initialIndex: bottomNavState);

    return PersistentTabView(context,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                AppColor.grey10,
        controller: controller,
        navBarStyle: NavBarStyle.style15,
        navBarHeight: 65,
        padding: const EdgeInsets.only(bottom: 8),
        confineToSafeArea: true,
        screens: const [
          Icon(Icons.wallet),
          Icon(Icons.wallet),
          Icon(Icons.home),
          Icon(Icons.grid_on),
          SettingPage(),
        ], onItemSelected: (int index) {
      ref.read(bottomNavbarStateProvider.notifier).setIndex(index);
    },
        items: [
          {
            'title': 'bottom_nav.notice'.tr(),
            'icon': const Icon(Icons.notification_important),
          },
          {
            'title': 'bottom_nav.wallet'.tr(),
            'icon': const Icon(Icons.account_balance_wallet),
          },
          {
            'title': 'bottom_nav.home'.tr(),
            'icon': Icon(
              Icons.home,
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            ),
            'isCenter': true
          },
          {
            'title': 'bottom_nav.community'.tr(),
            'icon': const Icon(Icons.grid_view),
          },
          {
            'title': 'bottom_nav.settings'.tr(),
            'icon': const Icon(Icons.settings),
          },
        ].map(
          (nav) {
            return _builBottomNavbarItem(context, nav);
          },
        ).toList());
  }

  PersistentBottomNavBarItem _builBottomNavbarItem(
      BuildContext context, dynamic item) {
    final icon = item['icon'] as Widget;
    final title = item['title'] as String;
    final isCenter = item['isCenter'] ?? false;

    return PersistentBottomNavBarItem(
      icon: Container(
        margin: isCenter ? null : const EdgeInsets.only(top: 10),
        child: icon,
      ),
      title: title,
      activeColorPrimary:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
              AppColor.grey80,
      inactiveColorPrimary:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
              AppColor.grey40,
    );
  }
}
