import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum SvgImageType { asset, network }

class SvgImageWidget extends StatelessWidget {
  final String imageName;
  final SvgImageType type;
  final Size size;

  const SvgImageWidget({
    super.key,
    required this.imageName,
    required this.type,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (type == SvgImageType.asset) {
      return SvgPicture.asset(
        'assets/images/$imageName',
        width: size.width,
        height: size.height,
        fit: BoxFit.fitHeight,
      );
    }

    return SvgPicture.network(
      imageName,
      placeholderBuilder: (BuildContext context) =>
          const CircularProgressIndicator(), // 이미지 로딩 중에 보여줄 위젯
    );
  }
}
