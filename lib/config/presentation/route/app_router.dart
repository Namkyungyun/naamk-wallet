import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naamk_wallet/app/app_shell.dart';
import 'package:naamk_wallet/app/event/screen.dart';
import 'package:naamk_wallet/app/event/pages/spining_wheel/spinning_wheel_page.dart';
import 'package:naamk_wallet/app/home/home_screen.dart';
import 'package:naamk_wallet/app/notice/notice_screen.dart';
import 'package:naamk_wallet/app/setting/setting_screen.dart';
import 'package:naamk_wallet/app/wallet/wallet_screen.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';
import 'package:naamk_wallet/config/presentation/route/fade_extension.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter goRoute = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    redirect: (context, state) {
      // 테마 변경 시 유지되도록

      // 로그아웃 진행 시, 로그인 화면으로

      // 네트워크 끊겼을 시 네트워크 오류 화면으로
      return null;
    },
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) => AppShell(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppGnbRoute.notices.route,
                builder: (context, state) => const NoticeScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppGnbRoute.wallet.route,
                builder: (context, state) => const WalletScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppGnbRoute.home.route,
                builder: (context, state) => const HomeScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppGnbRoute.events.route,
                builder: (context, state) => const EventScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppGnbRoute.settings.route,
                builder: (context, state) => const SettingScreen(),
              ).fade(),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '${AppGnbRoute.events.route}/rullet',
        parentNavigatorKey: _rootNavigatorKey, // 중요!
        builder: (context, state) => const SpinningWheelPage(),
      ).fade()
    ],
  );
  GoRouter get getGoRouter => goRoute;
  BuildContext? get getCurrentContext => _rootNavigatorKey.currentContext;
}
