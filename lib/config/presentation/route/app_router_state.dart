import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naamk_wallet/app/main_screen_shell.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';

class AppRouterState {
  static final shellUrl = [
    AppGnbRoute.notices.route,
    AppGnbRoute.wallet.route,
    AppGnbRoute.home.route,
    AppGnbRoute.events.route,
    AppGnbRoute.settings.route,
  ];

  static void pushDetailPageWithShell(BuildContext context, String url) {
    final shell = MainNavigationShellHolder.getShell;

    if (shell != null) {
      final String currentPath =
          GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
      final int currentIndex = shell.currentIndex;

      if (currentPath == url) return;

      // 현재 루트 뎁스 인지체크
      final isCurrentShellScreen =
          shellUrl.where((el) => el == currentPath).isNotEmpty;

      final int tobeIndex = shellUrl.indexWhere((el) => url.contains(el));

      // 루트 뎁스면서 이동 되어야 하는 index와 현재 index가 다르면 index변경
      if (isCurrentShellScreen && currentIndex != tobeIndex) {
        shell.goBranch(tobeIndex);
      }

      // 루트 뎁스가 아닌 경우 >> 창 닫아버리기
      if (!isCurrentShellScreen) {
        context.go(shellUrl.elementAt(tobeIndex));
      }

      context.push(url);
    }
  }
}
