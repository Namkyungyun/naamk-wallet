import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/route/app_route_path.dart';
import 'package:naamk_wallet/config/presentation/route/app_router.dart';

mixin AppPreconditionRouter<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  final _currentcontext = injector<AppRouter>().getCurrentContext;

  Future<void> showAppMaintenance() async {
    if (_currentcontext != null) {
      await showDialog(
        context: _currentcontext,
        builder: (_) => const AlertDialog(
          title: Text("점검 중"),
          content: Text("현재 점검 중입니다."),
        ),
      );
    }
  }

  Future<void> showAppForceUpdate() async {
    if (_currentcontext != null) {
      await showDialog(
        context: _currentcontext,
        builder: (_) => const AlertDialog(
          title: Text("버전 업데이트 필요"),
          content: Text("업데이트 후 사용가능합니다."),
        ),
      );
    }
  }

  Future<void> showLoginSessionExpired() async {
    if (_currentcontext != null) {
      await showDialog(
        context: _currentcontext,
        builder: (_) => const AlertDialog(
          title: Text("로그인 세션 만료"),
          content: Text("로그인 세션이 만료되었습니다.\n재로그인이 필요합니다."),
        ),
      );
      _currentcontext.go('/login');
    }
  }

  Future<void> showAppAuth() async {
    if (_currentcontext != null) {
      await _currentcontext.push(AppRoute.authConfirm.route);
    }
  }
}
