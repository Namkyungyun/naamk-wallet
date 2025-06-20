import 'package:flutter/services.dart';
import 'package:naamk_wallet/app/app_shell_state.dart';
import 'package:naamk_wallet/common/widgets/bottom_navbar_widget/custom_bottom_navbar_widget.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/config/theme/app_color.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  AppShell({
    super.key,
    required this.navigationShell,
  }) {
    AppShellState.setShell(navigationShell);
  }

  final List<IconData> _iconList = [
    Icons.notification_important,
    Icons.account_balance_wallet,
    Icons.home,
    Icons.grid_view,
    Icons.settings,
  ];

  final List<String> _labelList = [
    'bottom_nav.notice',
    'bottom_nav.wallet',
    'bottom_nav.home',
    'bottom_nav.event',
    'bottom_nav.settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      body: SafeArea(top: true, child: navigationShell),
      bottomNavigationBar: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                  AppColor.grey10, // 시스템 하단바 색상도 통일
          statusBarBrightness: Theme.of(context)
              .appBarTheme
              .systemOverlayStyle
              ?.statusBarBrightness,
          systemNavigationBarIconBrightness: Theme.of(context)
              .appBarTheme
              .systemOverlayStyle
              ?.statusBarIconBrightness,
        ),
        child: CustomBottomNavbarWidget(
          selectedIndex: navigationShell.currentIndex,
          onTap: (index) => navigationShell.goBranch(index),
          icons: _iconList,
          labels: _labelList,
        ),
      ),
    );
  }
}
