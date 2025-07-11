import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';

abstract class DataState<T> {
  final T? data;
  final AppException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T? data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(AppException? error) : super(error: error);
}
