import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/config/presentation/route/app_router.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

mixin AppErrorRouter<T extends ConsumerStatefulWidget> on ConsumerState<T> {
  final _currentcontext = injector<AppRouter>().getCurrentContext;

  Future<void> showError(String errorMessage) async {
    await showDialog(
      context: _currentcontext!,
      builder: (_) => AlertDialog(
        title: const Text("ERROR"),
        content: Text(errorMessage),
      ),
    );
  }
}
