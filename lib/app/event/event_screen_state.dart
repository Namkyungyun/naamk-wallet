import 'package:naamk_wallet/common/states/data_state.dart';
import 'package:naamk_wallet/common/states/view_state.dart';
import 'package:naamk_wallet/config/di/injector.dart';
import 'package:naamk_wallet/core/remote/domain/event_screen_domain.dart';
import 'package:naamk_wallet/core/remote/domain/event_screen_params.dart';
import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';
import 'package:naamk_wallet/core/remote/events/dtos/ui_dto/event_screen_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_screen_state.g.dart';

@riverpod
class EventScreenState extends _$EventScreenState {
  final EventScreenDomain _domain = injector<EventScreenDomain>();
  int pageForDaily = 0;
  int pageSizeForDaily = 10;
  bool hasMoreDaily = true;

  int pageForWeekly = 0;
  int pageSizeForWeekly = 10;
  bool hasMoreWeekly = true;

  @override
  EventScreenUiModel build() {
    return EventScreenUiModel.initial();
  }

  void loadInit() async {
    await loadDailyEventList();
  }

  void clearParams() {
    pageForDaily = 0;
    hasMoreDaily = true;

    pageForWeekly = 0;
    hasMoreWeekly = true;
  }

  Future<void> loadDailyEventList() async {
    // loading
    state = state.copyWith(
      dailyEvents: state.dailyEvents?.toLoading(),
    );

    final DataState<List<EventBannerResDto>> result =
        await _domain.getEventList().call(
                params: GetEventListParams(0, {
              'type': 'daily',
              'pageSize': pageSizeForDaily,
            }));

    // complete
    if (result is DataSuccess) {
      final List<EventBannerResDto> list = result.data ?? List.empty();

      if (list.isEmpty) {
        hasMoreDaily = false;
        state = state.copyWith(
          dailyEvents: state.dailyEvents?.toComplete(list),
        );
      } else {
        final List<EventBannerResDto> previous = state.dailyEvents?.data ?? [];
        final List<EventBannerResDto> merged = [...previous, ...list];

        state = state.copyWith(
          dailyEvents: state.dailyEvents?.toComplete(merged),
        );
      }
    }

    // error
    if (result is DataFailed) {
      state = state.copyWith(
          dailyEvents: ViewState.error(
              state.dailyEvents?.data, result.error.toString()));
    }
  }

  Future<void> loadWeeklyEventList() async {
    try {
      final DataState<List<EventBannerResDto>> result =
          await _domain.getEventList().call(
                  params: GetEventListParams(0, {
                'type': 'weekly',
                'pageSize': pageSizeForWeekly,
              }));

      if (result is DataSuccess) {}

      if (result is DataFailed) {}
    } catch (e) {
      rethrow;
    }
  }
}
