import 'package:gap/gap.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:naamk_wallet/app/event/pages/spining_wheel/spinning_wheel_page_state.dart';
import 'package:naamk_wallet/app/event/pages/spining_wheel/widgets/reverse_triangle_painter.dart';
import 'package:naamk_wallet/app/event/pages/spining_wheel/widgets/wheel_painter.dart';
import 'package:naamk_wallet/common/widgets/empty_appbar_widget.dart';
import 'package:naamk_wallet/common/widgets/global_loading_widget/global_overay_loading.dart';
import 'package:naamk_wallet/config/di/ui_common_module.dart';

class SpinningWheelPage extends HookConsumerWidget {
  const SpinningWheelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      "Apple",
      "Apple2",
      "Apple3",
      "Apple4",
      "Banana",
      "Cherry",
      "Date",
      "Elderberry",
      "Fig",
    ];

    final angle = ref.watch(spinningWheelStateProvider.select((s) => s.angle));
    final selectedItem =
        ref.watch(spinningWheelStateProvider.select((s) => s.selectedItem));
    final controller =
        useAnimationController(duration: const Duration(seconds: 5));
    final size = MediaQuery.of(context).size.width * 0.8;

    void onSpinComplete() {
      final selected = ref.read(spinningWheelStateProvider).selectedItem;
      if (selected != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("🎯 Result: $selected")),
        );
      }
    }

    return Scaffold(
      appBar: const EmptyAppbarWidget(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomPaint(
                size: const Size(20, 50),
                painter: ReverseTrianglePainter(),
              ),
              Center(
                child: Transform.rotate(
                  angle: angle,
                  child: CustomPaint(
                    size: Size(size, size),
                    painter: WheelPainter(items),
                  ),
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: () async {
                  // GlobalLoadingService.showOverlayLoading();
                  // await Future.delayed(const Duration(seconds: 5));
                  // GlobalLoadingService.hideOverlayLoading();

                  await test(context);

                  // 리셋
                  ref.read(spinningWheelStateProvider.notifier).reset();
                  // 추첨
                  ref.read(spinningWheelStateProvider.notifier).spinRandom(
                        items: items,
                        controller: controller,
                        onSpinComplete: onSpinComplete,
                      );
                },
                child: const Text("Start"),
              ),
              const Gap(20),
              if (selectedItem != null)
                Text("🎉 Selected: $selectedItem",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> test(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      useSafeArea: false,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Demo'),
          content: Text("Select button you want"),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context, "Cancel");
              },
            ),
          ],
        );
      },
    );
  }
}
