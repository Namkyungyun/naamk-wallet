import 'package:naamk_wallet/common/utils/api_handler_mixin.dart';
import 'package:naamk_wallet/remote/events/states/feature_state/list_state.dart';
import 'package:naamk_wallet/remote/common/states/view_state.dart';
import 'package:naamk_wallet/config/core/di/injector.dart';
import 'package:naamk_wallet/remote/usecases/event_usecases.dart';
import 'package:naamk_wallet/remote/events/dtos/req_dto/event_banner_req_dto.dart';
import 'package:naamk_wallet/remote/events/dtos/raw_dto/event_banner_raw_dto.dart';
import 'package:naamk_wallet/remote/events/states/screen_state/event_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_viewmodel.g.dart';

@riverpod
class EventScreenViewModel extends _$EventScreenViewModel with ApiHandlerMixin {
  late final EventUsecases _domain = injector<EventUsecases>();

  EventBannerReqDto get dailyListReq => state.dailyEventReq;
  EventBannerReqDto get weeklyListReq => state.weeklyEventReq;
  ViewState<EventListState> get dailyListState => state.dailyEventsRes;
  ViewState<EventListState> get weeklyListState => state.weeklyEventsRes;

  @override
  EventScreenState build() => EventScreenState.initial();

  void loadInit() async {
    loadDailyEventList();
    loadWeeklyEventList();
  }

  void loadDailyEventList() async {
    await executeApiCall<EventListState>(
      request: _domain.getEventList.call(req: dailyListReq),
      onLoading: () {
        state = state.copyWith(
          weeklyEventsRes: dailyListState.toLoading(),
        );
      },
      onSuccess: (featureState) {
        // extract data of feature state
        final List<EventBannerRawDto> newContents = featureState.contents;

        // 이전 데이터 + 새로운 데이터
        final EventListState prevFeatureState = dailyListState.data;
        final List<EventBannerRawDto> prevContents = prevFeatureState.contents;
        final List<EventBannerRawDto> mergedContents = [
          ...prevContents,
          ...newContents
        ];

        // complete & data 반영
        state = state.copyWith(
          dailyEventsRes: (mergedContents.isEmpty)
              ? dailyListState.toEmpty(
                  featureState.copyWith(contents: mergedContents),
                )
              : dailyListState.toComplete(
                  featureState.copyWith(contents: mergedContents),
                ),
        );
      },
      onError: (exception) {
        state = state.copyWith(
          dailyEventsRes: dailyListState.toError(
            exception,
          ),
        );
      },
    );
  }

  void loadWeeklyEventList() async {
    await executeApiCall<EventListState>(
      request: _domain.getEventList.call(req: weeklyListReq),
      onLoading: () {
        state = state.copyWith(
          weeklyEventsRes: weeklyListState.toLoading(),
        );
      },
      onSuccess: (featureState) {
        // extract data of feature state
        final List<EventBannerRawDto> newContents = featureState.contents;

        // 이전 데이터 + 새로운 데이터
        final EventListState prevFeatureState = weeklyListState.data;
        final List<EventBannerRawDto> prevContents = prevFeatureState.contents;
        final List<EventBannerRawDto> mergedContents = [
          ...prevContents,
          ...newContents
        ];

        // complete & data 반영
        state = state.copyWith(
          weeklyEventsRes: (mergedContents.isEmpty)
              ? weeklyListState.toEmpty(
                  featureState.copyWith(contents: mergedContents),
                )
              : weeklyListState.toComplete(
                  featureState.copyWith(contents: mergedContents),
                ),
        );
      },
      onError: (exception) {
        state = state.copyWith(
          weeklyEventsRes: weeklyListState.toError(
            exception,
          ),
        );
      },
    );
  }
}
