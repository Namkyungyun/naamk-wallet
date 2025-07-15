import 'package:naamk_wallet/common/utils/logger.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';
import 'package:naamk_wallet/remote/common/states/data_state.dart';

mixin ViewModelBaseApiHandler {
  Future<void> executeApiCall<T>({
    required Future<DataState<T>> request,
    required void Function() onLoading,
    required void Function(T data) onSuccess,
    required void Function(AppExceptionState exception) onError,
  }) async {
    try {
      final result = await request;

      if (result is DataSuccess<T> && result.data != null) {
        onSuccess(result.data as T);
      } else if (result is DataFailed<T> && result.error != null) {
        onError(result.error!);
        return;
      } else {
        onError(
          const AppExceptionState(
              code: 'ERROR', message: 'No feature state returned'),
        );
        return;
      }
    } catch (e) {
      GlobalLogger.error(
          '[ViewModelBaseApiHandler] invoked error !!\n${e.toString()}');
      onError(const AppExceptionState(
        code: 'ERROR',
        message: 'Invoked internal app error!',
      ));
    }
  }
}
