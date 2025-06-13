import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/app/event/event_screen.dart';
import 'package:naamk_wallet/app/home/home_screen.dart';
import 'package:naamk_wallet/app/notice/notice_screen.dart';
import 'package:naamk_wallet/app/wallet/wallet_screen.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/app/setting/setting_screen.dart';
import 'package:naamk_wallet/common/widgets/bottom_navbar_widget/bottom_navbar_state.dart';
import 'package:naamk_wallet/config/theme/app_color.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class BottomNavbarWidget extends ConsumerWidget {
  final double navbarHeight = 65.0;

  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavState = ref.watch(bottomNavbarStateProvider);
    final controller = PersistentTabController(initialIndex: bottomNavState);

    final backgroundColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
            AppColor.grey10;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor, // 시스템 하단바 색상도 통일
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        bottom: false,
        child: PersistentTabView(context,
            backgroundColor: backgroundColor,
            controller: controller,
            navBarStyle: NavBarStyle.style15,
            navBarHeight: navbarHeight,
            confineToSafeArea: false,
            screens: [
              _buildWrappedScreen(const NoticeScreen()),
              _buildWrappedScreen(const WalletScreen()),
              _buildWrappedScreen(const HomeScreen()),
              _buildWrappedScreen(const EventScreen()),
              _buildWrappedScreen(const SettingScreen()),
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
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                ),
                'isCenter': true
              },
              {
                'title': 'bottom_nav.event'.tr(),
                'icon': const Icon(Icons.grid_view),
              },
              {
                'title': 'bottom_nav.settings'.tr(),
                'icon': const Icon(Icons.settings),
              },
            ].map(
              (nav) {
                return _buildBottomNavbarItem(context, nav);
              },
            ).toList()),
      ),
    );
  }

  Widget _buildWrappedScreen(Widget screen) =>
      Padding(padding: const EdgeInsets.only(bottom: 8), child: screen);

  PersistentBottomNavBarItem _buildBottomNavbarItem(
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
      textStyle: const TextStyle(height: 2),
      activeColorPrimary:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
              AppColor.grey80,
      inactiveColorPrimary:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
              AppColor.grey40,
    );
  }
}
