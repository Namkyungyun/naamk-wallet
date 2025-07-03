import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/remote/events/dtos/feature_state/daily_list_state.dart';
import 'package:naamk_wallet/common/states/view_state.dart';
import 'package:naamk_wallet/remote/events/dtos/req_dto/event_banner_req_dto.dart';

part 'event_screen_state.freezed.dart';

@freezed
class EventScreenState with _$EventScreenState {
  const factory EventScreenState({
    @Default(EventBannerReqDto()) EventBannerReqDto dailyEventReq,
    @Default(EventBannerReqDto()) EventBannerReqDto weeklyEventReq,
    @Default(ViewState<EventListState>())
    ViewState<EventListState> dailyEventsRes,
    @Default(ViewState<EventListState>())
    ViewState<EventListState> weeklyEventsRes,
  }) = _EventScreenState;

  factory EventScreenState.initial() => EventScreenState(
        dailyEventReq: const EventBannerReqDto(options: {'type': 'daily'}),
        weeklyEventReq: const EventBannerReqDto(options: {'type': 'weekly'}),
        dailyEventsRes: ViewState<EventListState>.empty(
          const EventListState(),
        ),
        weeklyEventsRes: ViewState<EventListState>.empty(
          const EventListState(),
        ),
      );
}
