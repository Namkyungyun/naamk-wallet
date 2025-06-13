import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naamk_wallet/common/widgets/image_widget.dart';

class EventCardWidget extends StatelessWidget {
  final String title;
  final String intro;
  final String imagePath;
  final bool isMain;

  const EventCardWidget({
    super.key,
    this.title = '',
    this.intro = '',
    required this.imagePath,
    this.isMain = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageWidget(
              imageName: imagePath,
              type: ImageType.asset,
            ),
          ),
          if (isMain)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(5),
                    Text(
                      title,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const Gap(5),
                    Text(
                      intro,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.clip,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const Gap(5),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
