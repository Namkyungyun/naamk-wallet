import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

enum ResponseState { EMPTY, LOADING, COMPLETE, ERROR }

@freezed
class ViewState<T> with _$ViewState {
  const factory ViewState({
    @Default(ResponseState.EMPTY) ResponseState state,
    @Default(null) T? data,
    @Default(null) String? exception,
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

  factory ViewState.error(T previousData, String exception) => ViewState<T>(
        state: ResponseState.ERROR,
        data: previousData,
        exception: exception,
      );
}

extension ViewStateExt<T> on ViewState<T> {
  ViewState<T> toLoading() => ViewState<T>.loading(data);
  ViewState<T> toComplete(T newData) => ViewState<T>.complete(newData);
  ViewState<T> toError(String message) => ViewState<T>.error(data, message);
}
