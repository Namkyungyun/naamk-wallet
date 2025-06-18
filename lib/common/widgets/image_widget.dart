import 'package:flutter/material.dart';

enum ImageType { asset, network }

class ImageWidget extends StatelessWidget {
  final String imageName;
  final ImageType type;
  final Size? size;
  final Color? color;
  final double? borderRadius;

  const ImageWidget(
      {super.key,
      required this.imageName,
      required this.type,
      this.size,
      this.color,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    if (type == ImageType.asset) {
      return Image.asset(
        'assets/images/$imageName',
        width: size?.width,
        height: size?.height,
        fit: BoxFit.cover,
        color: color,
      );
    }

    return Image.network(
      imageName,
      width: size?.width,
      height: size?.height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        );
      },
    );
  }
}
