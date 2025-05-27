import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naamk_wallet/config/route/app_route_path.dart';
import 'package:naamk_wallet/config/route/fade_extension.dart';
import 'package:naamk_wallet/app/home/home_screen.dart';

class AppRouter {
  final GoRouter goRoute = GoRouter(
    initialLocation: AppRoute.firstScreen.route,
    routes: <GoRoute>[
      GoRoute(
        path: AppRoute.firstScreen.route,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
      ).fade(),
      // GoRoute(
      //   path: AppRoute.secondScreen.route,
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const SecondScreen(),
      // ).fade(),
    ],
  );
  GoRouter get getGoRouter => goRoute;
}
