import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naamk_wallet/app/app_shell.dart';
import 'package:naamk_wallet/app/event/event_screen.dart';
import 'package:naamk_wallet/app/event/spining_wheel/spinning_wheel_page.dart';
import 'package:naamk_wallet/app/home/home_screen.dart';
import 'package:naamk_wallet/app/notice/notice_screen.dart';
import 'package:naamk_wallet/app/setting/setting_screen.dart';
import 'package:naamk_wallet/app/wallet/wallet_screen.dart';
import 'package:naamk_wallet/config/route/app_route_path.dart';
import 'package:naamk_wallet/config/route/fade_extension.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter goRoute = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => AppShell(
          navigationShell: navigationShell,
        ),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.notice.route,
                builder: (context, state) => const NoticeScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.wallet.route,
                builder: (context, state) => const WalletScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.route,
                builder: (context, state) => const HomeScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.event.route,
                builder: (context, state) => const EventScreen(),
              ).fade(),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.settings.route,
                builder: (context, state) => const SettingScreen(),
              ).fade(),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '${AppRoute.event.route}/rullet',
        parentNavigatorKey: _rootNavigatorKey, // 중요!
        builder: (context, state) => const SpinningWheelPage(),
      ).fade()
    ],
  );
  GoRouter get getGoRouter => goRoute;
}
