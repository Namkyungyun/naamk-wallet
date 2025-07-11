import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';

part 'view_state.freezed.dart';

enum ResponseState { EMPTY, LOADING, COMPLETE, ERROR }

@freezed
class ViewState<T> with _$ViewState {
  const factory ViewState({
    @Default(ResponseState.EMPTY) ResponseState state,
    @Default(null) T? data,
    @Default(null) AppException? exception,
  }) = _ViewState;

  factory ViewState.empty(T emptyData) => ViewState<T>(
        state: ResponseState.EMPTY,
        data: emptyData,
      );

  factory ViewState.loading(T previousData) => ViewState<T>(
        state: ResponseState.LOADING,
        data: previousData,
      );

  factory ViewState.complete(T newData) => ViewState<T>(
        state: ResponseState.COMPLETE,
        data: newData,
      );

  factory ViewState.error(T previousData, AppException exception) =>
      ViewState<T>(
        state: ResponseState.ERROR,
        data: previousData,
        exception: exception,
      );
}

extension ViewStateExt<T> on ViewState<T> {
  ViewState<T> toEmpty(T emptyData) => ViewState<T>.empty(emptyData);
  ViewState<T> toLoading() => ViewState<T>.loading(data);
  ViewState<T> toComplete(T newData) => ViewState<T>.complete(newData);
  ViewState<T> toError(AppException exception) =>
      ViewState<T>.error(data, exception);
}
