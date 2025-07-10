import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:naamk_wallet/app/app_error_router.dart';
import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/feature/error/app_error_state.dart';
import 'package:naamk_wallet/config/feature/error/app_error_state_manager.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class AppErrorListener extends ConsumerStatefulWidget {
  const AppErrorListener({super.key});

  @override
  ConsumerState<AppErrorListener> createState() => _AppErrorListenerState();
}

class _AppErrorListenerState extends ConsumerState<AppErrorListener>
    with AppErrorRouter {
  late final ProviderSubscription<AppError>? _appErrorSubscription;

  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _appErrorSubscription?.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_initialized) {
      _initialized = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _appErrorSubscription = ref.listenManual<AppError>(
            appErrorStateManagerProvider, (prev, next) async {
          GlobalLogger.info('[appError state] $prev → $next');

          if (!prev?.show && next.show) {
            await showError(next.message);

            ref
                .read<AppErrorStateManager>(
                    appErrorStateManagerProvider.notifier)
                .hideError();
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // 네트워크 에러 화면
    //
    return const SizedBox.shrink(); // UI 없음
  }
}
