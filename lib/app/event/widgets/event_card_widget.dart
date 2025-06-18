import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:naamk_wallet/common/widgets/image_widget.dart';

class EventCardWidget extends StatelessWidget {
  final String title;
  final String intro;
  final String imagePath;
  final VoidCallback onTap;
  final bool isMain;

  const EventCardWidget({
    super.key,
    this.title = '',
    this.intro = '',
    required this.imagePath,
    required this.onTap,
    this.isMain = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isMain) {
      return Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ImageWidget(
                  imageName: imagePath,
                  type: ImageType.network,
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
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          intro,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Gap(5),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      );
    }

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ImageWidget(
            imageName: imagePath,
            type: ImageType.network,
          ),
        ),
      ),
    );
  }
}
