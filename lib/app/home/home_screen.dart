import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/common/widgets/bottom_navbar_widget/bottom_navbar_widget.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      bottomNavigationBar: const BottomNavbarWidget(),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: Container(),
    );
  }
}
