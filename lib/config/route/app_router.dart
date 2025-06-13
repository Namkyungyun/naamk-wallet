import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naamk_wallet/app/app_shell.dart';
import 'package:naamk_wallet/app/event/spining_wheel/spinning_wheel_page.dart';
import 'package:naamk_wallet/app/setting/setting_screen.dart';
import 'package:naamk_wallet/config/route/app_route_path.dart';
import 'package:naamk_wallet/config/route/fade_extension.dart';

class AppRouter {
  final GoRouter goRoute = GoRouter(
    initialLocation: AppRoute.home.route,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoute.home.route,
        builder: (BuildContext context, GoRouterState state) =>
            const AppShell(),
      ).fade(),
      GoRoute(
        path: AppRoute.settings.route,
        builder: (BuildContext context, GoRouterState state) =>
            const SettingScreen(),
      ).fade(),
      GoRoute(
        path: AppRoute.event.route,
        builder: (BuildContext context, GoRouterState state) =>
            const SpinningWheelPage(),
      ).fade(),
    ],
  );
  GoRouter get getGoRouter => goRoute;
}
