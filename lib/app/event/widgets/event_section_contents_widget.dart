import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:naamk_wallet/app/event/widgets/event_card_widget.dart';
import 'package:naamk_wallet/common/widgets/image_widget.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';
import 'package:naamk_wallet/core/remote/events/dtos/res_dto/event_banner_res_dto.dart';

class SectionContentsWidget extends StatelessWidget {
  final List<EventBannerResDto> contents;
  const SectionContentsWidget({
    super.key,
    required this.contents,
  });

  void pushEventDetail(BuildContext context, String linkUrl) {
    if (linkUrl.contains('http')) {
      // 웹 연결
    } else {
      // 앱 내 상세 화면 연결

      GoRouter.of(context).push('/event/rullet');
    }
  }

  @override
  Widget build(BuildContext context) {
    const int crossAxisCount = 4;
    const int contentxMaxCount = 4;
    final int contentsCount =
        (contents.length > contentxMaxCount) ? 4 : contents.length;

    if (contentsCount == 0) {
      return SizedBox(
          child: Center(
        child: ImageWidget(
          imageName: 'emptybox-icon.png',
          type: ImageType.asset,
          size: const Size(60, 60),
          color: Theme.of(context).disabledColor,
        ),
      ));
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StaggeredGrid.count(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(contentsCount, (i) {
          final EventBannerResDto item = contents[i];
          if (i == 0) {
            return StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: EventCardWidget(
                  title: item.title,
                  intro: item.intro,
                  imagePath: item.imagePath,
                  onTap: () => pushEventDetail(context, item.linkUrl),
                  isMain: true,
                ));
          }

          return StaggeredGridTile.count(
              crossAxisCellCount: crossAxisCount,
              mainAxisCellCount: 1,
              child: EventCardWidget(
                imagePath: item.imagePath,
                onTap: () => pushEventDetail(context, item.linkUrl),
                isMain: false,
              ));
        }),
      ),
    );
  }
}
