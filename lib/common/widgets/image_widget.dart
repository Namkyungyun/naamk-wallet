import 'package:flutter/material.dart';

enum ImageType { asset, network }

class ImageWidget extends StatelessWidget {
  final String imageName;
  final ImageType type;
  final Size? size;

  const ImageWidget({
    super.key,
    required this.imageName,
    required this.type,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    if (type == ImageType.asset) {
      return Image.asset(
        'assets/images/$imageName',
        width: size?.width,
        height: size?.height,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      imageName,
      width: size?.width,
      height: size?.height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return const CircularProgressIndicator();
      },
    );
  }
}
