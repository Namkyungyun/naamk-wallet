import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';
import 'package:naamk_wallet/remote/common/states/data_state.dart';

mixin ApiHandlerMixin {
  Future<void> executeApiCall<T>({
    required Future<DataState<T>> request,
    required void Function() onLoading,
    required void Function(T data) onSuccess,
    required void Function(AppException exception) onError,
  }) async {
    try {
      final result = await request;

      if (result is DataSuccess<T> && result.data != null) {
        onSuccess(result.data as T);
      } else if (result is DataFailed<T> && result.error != null) {
        onError(result.error!);
      } else {
        onError(
          const AppException(code: 'NULL_STATE', message: 'No data returned'),
        );
      }
    } catch (e) {
      onError(AppException(code: 'EXCEPTION', message: e.toString()));
    }
  }
}
