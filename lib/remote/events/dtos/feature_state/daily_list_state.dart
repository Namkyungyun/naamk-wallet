import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/remote/common/pagination_dto/pagination_res_dto.dart';
import 'package:naamk_wallet/remote/events/dtos/raw_dto/event_banner_raw_dto.dart';

part 'daily_list_state.freezed.dart';
part 'daily_list_state.g.dart';

@freezed
class EventListState with _$EventListState {
  const factory EventListState({
    @Default(PaginationResDto()) PaginationResDto pagination,
    @Default([]) List<EventBannerRawDto> contents,
  }) = _EventDailyListState;

  factory EventListState.fromJson(Map<String, dynamic> json) =>
      _$EventListStateFromJson(json);
}
