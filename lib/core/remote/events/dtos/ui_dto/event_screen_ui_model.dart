import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:naamk_wallet/common/states/view_state.dart';
import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';

// part 'event_screen_ui_model.g.dart';
part 'event_screen_ui_model.freezed.dart';

@freezed
class EventScreenUiModel with _$EventScreenUiModel {
  factory EventScreenUiModel({
    ViewState<List<EventBannerResDto>>? dailyEvents,
    ViewState<List<EventBannerResDto>>? weeklyEvents,
  }) = _EventScreenUiModel;

  factory EventScreenUiModel.initial() => EventScreenUiModel(
      dailyEvents: ViewState.empty([]), weeklyEvents: ViewState.empty([]));
}
