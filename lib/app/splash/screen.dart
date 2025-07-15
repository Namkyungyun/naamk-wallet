import 'package:flutter/material.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';
import 'package:naamk_wallet/common/widgets/image_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EmptyAppbarWidget(),
      backgroundColor: Colors.white,
      body: Center(
        child: ImageWidget(
          imageName: 'init_icon.gif',
          type: ImageType.asset,
          size: Size(120, 120),
        ),
      ),
    );
  }
}
