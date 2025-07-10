import 'package:naamk_wallet/config/feature/error/app_error_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_error_state_manager.g.dart';

@Riverpod(keepAlive: true)
class AppErrorStateManager extends _$AppErrorStateManager {
  @override
  AppError build() {
    return const AppError();
  }

  void showError({String? code, required String message}) {
    state = state.copyWith(show: true, code: code, message: message);
  }

  void hideError() {
    state = state.copyWith(show: false, code: '', message: '');
  }
}
