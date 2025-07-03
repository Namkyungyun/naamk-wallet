import 'package:naamk_wallet/remote/events/states/feature_state/list_state.dart';
import 'package:naamk_wallet/common/states/data_state.dart';
import 'package:naamk_wallet/common/states/view_state.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/remote/usecases/event_usecases.dart';
import 'package:naamk_wallet/remote/events/dtos/req_dto/event_banner_req_dto.dart';
import 'package:naamk_wallet/remote/events/dtos/raw_dto/event_banner_raw_dto.dart';
import 'package:naamk_wallet/remote/events/states/screen_state/event_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_viewmodel.g.dart';

@riverpod
class EventScreenViewModel extends _$EventScreenViewModel {
  late final EventUsecases _domain = injector<EventUsecases>();

  EventBannerReqDto get dailyListReq => state.dailyEventReq;
  EventBannerReqDto get weeklyListReq => state.weeklyEventReq;
  ViewState<EventListState> get dailyListState => state.dailyEventsRes;
  ViewState<EventListState> get weeklyListState => state.weeklyEventsRes;

  @override
  EventScreenState build() => EventScreenState.initial();

  void loadInit() async {
    await loadDailyEventList();
    await loadWeeklyEventList();
  }

  Future<void> loadDailyEventList() async {
    // loading
    state = state.copyWith(
      dailyEventsRes: dailyListState.toLoading(),
    );

    try {
      final DataState<EventListState> dataStateResult =
          await _domain.getEventList.call(req: dailyListReq);

      // API DataSuccess
      if (dataStateResult is DataSuccess) {
        final EventListState? newFeatureState = dataStateResult.data;

        if (newFeatureState != null) {
          final List<EventBannerRawDto> newContents = newFeatureState.contents;

          // 이전 데이터 + 새로운 데이터
          final EventListState prevState = dailyListState.data;
          final List<EventBannerRawDto> prevContents = prevState.contents;
          final List<EventBannerRawDto> mergedContents = [
            ...prevContents,
            ...newContents
          ];

          state = state.copyWith(
            dailyEventsRes: (mergedContents.isEmpty)
                ? dailyListState.toEmpty(
                    newFeatureState.copyWith(contents: mergedContents),
                  )
                : dailyListState.toComplete(
                    newFeatureState.copyWith(contents: mergedContents),
                  ),
          );
        } else {
          // Error && 에러 반영
          const String errorMessage = 'Data of EventListState is Null.';
          throw errorMessage;
        }
      }

      // DataFailed
      if (dataStateResult is DataFailed) {
        final String errorMessage = dataStateResult.error.toString();
        throw errorMessage;
      }
    } catch (e) {
      state =
          state.copyWith(dailyEventsRes: dailyListState.toError(e.toString()));
    }
  }

  Future<void> loadWeeklyEventList() async {
    // loading
    state = state.copyWith(weeklyEventsRes: weeklyListState.toLoading());

    try {
      // call usecase
      final DataState<EventListState> dataStateResult =
          await _domain.getEventList.call(req: weeklyListReq); // type이 weekly

      // extract feature state
      if (dataStateResult is DataSuccess) {
        final EventListState? newFeatureState = dataStateResult.data;

        // extract data of feature state
        if (newFeatureState != null) {
          final List<EventBannerRawDto> newContents = newFeatureState.contents;

          // 이전 데이터 + 새로운 데이터
          final EventListState prevFeatureState = weeklyListState.data;
          final List<EventBannerRawDto> prevContents =
              prevFeatureState.contents;
          final List<EventBannerRawDto> mergedContents = [
            ...prevContents,
            ...newContents
          ];

          // complete & data 반영
          state = state.copyWith(
            weeklyEventsRes: (mergedContents.isEmpty)
                ? dailyListState.toEmpty(
                    newFeatureState.copyWith(contents: mergedContents),
                  )
                : dailyListState.toComplete(
                    newFeatureState.copyWith(contents: mergedContents),
                  ),
          );
          // no feature state
        } else {
          // Error && 에러 반영
          const String errorMessage = 'Data of EventListState is Null.';
          throw errorMessage;
        }
      }

      if (dataStateResult is DataFailed) {
        final String errorMessage = dataStateResult.error.toString();
        throw errorMessage;
      }
    } catch (e) {
      state =
          state.copyWith(dailyEventsRes: dailyListState.toError(e.toString()));
    }
  }
}
