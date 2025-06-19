import 'package:flutter/material.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/config/route/app_router.dart';
import 'package:naamk_wallet/common/widgets/global_loading_widget/global_loading_dot_widget.dart';
import 'package:go_router/go_router.dart';

class GlobalLoadingService {
  static void show() {
    final AppRouter router = injector<AppRouter>();
    final BuildContext? context = router.getCurrentContext;

    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Theme.of(context).shadowColor,
        useSafeArea: false,
        builder: (ctx) {
          return GlobalLoadingDotWidget(
            size: Size(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height),
          ); // 커스텀 로딩 위젯
        },
      );
    }
  }

  static void hide() {
    final AppRouter router = injector<AppRouter>();
    final BuildContext? context = router.getCurrentContext;

    if (context != null && context.canPop()) {
      context.pop();
    }
  }
}
