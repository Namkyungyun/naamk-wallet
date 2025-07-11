import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_exception_state_manager.g.dart';

@Riverpod(keepAlive: true)
class AppErrorStateManager extends _$AppErrorStateManager {
  @override
  AppException build() {
    return const AppException();
  }

  void showError(AppException? exception) {
    if (exception != null) {
      state = state.copyWith(
        show: true,
        code: exception.code,
        message: exception.message,
        detailMessage: exception.detailMessage,
      );
    }
  }

  void hideError() {
    state = state.copyWith(
      show: false,
      code: '',
      message: '',
      detailMessage: '',
    );
  }
}
