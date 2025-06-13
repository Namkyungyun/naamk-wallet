import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naamk_wallet/app/event/widgets/event_card_widget.dart';
import 'package:naamk_wallet/common/widgets/title_appbar_widget.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:gap/gap.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              SectionContentsWidget(
                contents: ['1', '2', '3', '4', '5', '1', '2', '3', '4', '5'],
              ),
              const Gap(12),
              const SectionTitleWidget(
                title: 'Weekly Event',
                isMore: true,
              ),
              SectionContentsWidget(
                contents: [
                  '1',
                  '2',
                  '3',
                  '4',
                  '5',
                  '1',
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  final String title;
  final bool isMore;
  final VoidCallback? onPushDetail;

  const SectionTitleWidget({
    super.key,
    required this.title,
    required this.isMore,
    this.onPushDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        IconButton(
          onPressed: onPushDetail,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ),
      ],
    );
  }
}

class SectionContentsWidget extends StatelessWidget {
  final List contents;
  const SectionContentsWidget({
    super.key,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    const int crossAxisCount = 4;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StaggeredGrid.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(4, (i) {
          if (i == 0) {
            return StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: EventCardWidget(
                  title: '돌려 돌려 돌림판!',
                  intro: '매일 행운의 기회를\n잡아보세요🔥',
                  imagePath: 'event_checkin_banner.png',
                  isMain: true,
                ));
          }

          return StaggeredGridTile.count(
              crossAxisCellCount: crossAxisCount,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.green[100 * (i % 8 + 1)],
                height: 100,
              ));
        }),
      ),
    );
  }
}
