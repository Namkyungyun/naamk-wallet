import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state.dart';

part 'view_state.freezed.dart';

enum ResponseStatus { EMPTY, LOADING, COMPLETE, ERROR }

@freezed
class ViewState<T> with _$ViewState {
  const factory ViewState({
    @Default(ResponseStatus.EMPTY) ResponseStatus state,
    @Default(null) T? data,
    @Default(null) AppExceptionState? exception,
  }) = _ViewState;

  factory ViewState.empty(T emptyData) => ViewState<T>(
        state: ResponseStatus.EMPTY,
        data: emptyData,
      );

  factory ViewState.loading(T previousData) => ViewState<T>(
        state: ResponseStatus.LOADING,
        data: previousData,
      );

  factory ViewState.complete(T newData) => ViewState<T>(
        state: ResponseStatus.COMPLETE,
        data: newData,
      );

  factory ViewState.error(T previousData, AppExceptionState exception) =>
      ViewState<T>(
        state: ResponseStatus.ERROR,
        data: previousData,
        exception: exception,
      );
}

extension ViewStateExt<T> on ViewState<T> {
  ViewState<T> toEmpty(T emptyData) => ViewState<T>.empty(emptyData);
  ViewState<T> toLoading() => ViewState<T>.loading(data);
  ViewState<T> toComplete(T newData) => ViewState<T>.complete(newData);
  ViewState<T> toError(AppExceptionState exception) =>
      ViewState<T>.error(data, exception);
}
