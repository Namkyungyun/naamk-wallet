import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/config/feature/exception/app_exception_state_manager.dart';
import 'package:naamk_wallet/remote/events/states/feature_state/list_state.dart';
import 'package:naamk_wallet/app/event/screen_viewmodel.dart';
import 'package:naamk_wallet/app/event/widgets/event_section_contents_widget.dart';
import 'package:naamk_wallet/app/event/widgets/event_section_title_widget.dart';
import 'package:naamk_wallet/remote/common/states/view_state.dart';
import 'package:naamk_wallet/common/widgets/title_appbar_widget.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';

class EventScreen extends HookConsumerWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.microtask(() {
        ref.read(eventScreenViewModelProvider.notifier).loadInit();
      });
      return null;
    }, []);

    return Scaffold(
      appBar: const TitleAppbarWidget(title: 'page_title.event'),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
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
              const WeeklyEventSectionWidget(),
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
      final ViewState<EventListState> viewState =
          ref.watch(eventScreenViewModelProvider).dailyEventsRes;

      final ResponseState state = viewState.state;
      final EventListState data = viewState.data;

      switch (state) {
        case ResponseState.EMPTY:
          return SectionContentsWidget(contents: data.contents);
        case ResponseState.LOADING:
          return SectionContentsWidget(contents: data.contents);
        case ResponseState.COMPLETE:
          return SectionContentsWidget(contents: data.contents);
        case ResponseState.ERROR:
          Future.microtask(() {
            ref
                .read(appErrorStateManagerProvider.notifier)
                .showError(viewState.exception);
          });

          return Container();
      }
    });
  }
}

class WeeklyEventSectionWidget extends ConsumerWidget {
  const WeeklyEventSectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (cotext, ref, _) {
      final ViewState<EventListState> viewState =
          ref.watch(eventScreenViewModelProvider).weeklyEventsRes;

      final ResponseState state = viewState.state;
      final EventListState data = viewState.data;

      switch (state) {
        case ResponseState.EMPTY:
          return SectionContentsWidget(contents: data.contents);
        case ResponseState.LOADING:
          return SectionContentsWidget(contents: data.contents);
        case ResponseState.COMPLETE:
          return SectionContentsWidget(contents: data.contents);
        case ResponseState.ERROR:
          Future.microtask(() {
            ref
                .read(appErrorStateManagerProvider.notifier)
                .showError(viewState.exception);
          });

          return Container();
      }
    });
  }
}
