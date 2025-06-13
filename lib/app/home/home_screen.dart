import 'package:flutter/material.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      body: SafeArea(child: Center(child: Text('main'))),
    );
  }
}
