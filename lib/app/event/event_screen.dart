import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/event/event_screen_state.dart';
import 'package:naamk_wallet/app/event/widgets/event_section_contents_widget.dart';
import 'package:naamk_wallet/app/event/widgets/event_section_title_widget.dart';
import 'package:naamk_wallet/common/states/view_state.dart';
import 'package:naamk_wallet/common/widgets/title_appbar_widget.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:gap/gap.dart';
import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';

class EventScreen extends HookConsumerWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        ref.read(eventScreenStateProvider.notifier).loadInit();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: const TitleAppbarWidget(title: '이벤트'),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 70.0),
          child: ListView(
            children: [
              SectionTitleWidget(
                title: 'Daily Event',
                isMore: true,
                onPushDetail: () => {},
              ),
              const DailyEventSecionWidget(),
              const Gap(12),
              const SectionTitleWidget(
                title: 'Weekly Event',
                isMore: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DailyEventSecionWidget extends ConsumerWidget {
  const DailyEventSecionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (cotext, ref, _) {
      final ViewState<List<EventBannerResDto>>? viewState =
          ref.watch(eventScreenStateProvider).dailyEvents;

      final ResponseState? state = viewState?.state;
      final List<EventBannerResDto> data = viewState?.data ?? [];

      return switch (state) {
        ResponseState.EMPTY => const SectionContentsWidget(contents: []),
        ResponseState.LOADING => const SectionContentsWidget(contents: []),
        ResponseState.COMPLETE => SectionContentsWidget(contents: data),
        _ => Container(),
      };
    });
  }
}
