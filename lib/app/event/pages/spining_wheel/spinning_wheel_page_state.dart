import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:naamk_wallet/app/event/pages/spining_wheel/spinning_wheel_page_ui_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spinning_wheel_page_state.g.dart';

@riverpod
class SpinningWheelState extends _$SpinningWheelState {
  @override
  SpinningWheelUiModel build() {
    return const SpinningWheelUiModel(angle: 0, selectedItem: null);
  }

  void updateAngle(double newAngle) {
    state = state.copyWith(angle: newAngle);
  }

  void setSelectedItem(String item) {
    state = state.copyWith(selectedItem: item);
  }

  void reset() {
    state = const SpinningWheelUiModel(angle: 0, selectedItem: null);
  }

  void spinRandom({
    required List<String> items,
    required AnimationController controller,
    required VoidCallback onSpinComplete,
  }) {
    const int spins = 5;
    const double pointerAngle = -pi / 2; // 화살표 (0, -1) 각도
    final double anglePerItem = 2 * pi / items.length; // 각 요소의 각도

    final randomOffset = Random().nextDouble() * 2 * pi; // 랜덤 각도
    final double begin = state.angle % (2 * pi);
    final double end = begin + spins * 2 * pi + randomOffset;

    final animation = Tween<double>(begin: begin, end: end).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutQuart),
    );

    animation.addListener(() {
      updateAngle(animation.value);
    });

    // 각도를 음수, 양수에 대한 범위지정하지 않고 정규화하는 계산식.
    double normalize(double angle) => (angle + 2 * pi) % (2 * pi);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 각 회전판 요소 영역 정규화하여 start, end 값 계산해 저장
        final itemRegions = <int, (double start, double end)>{};
        for (int i = 0; i < items.length; i++) {
          final rawStart = anglePerItem * i - pi / 2 + anglePerItem / 2;
          final itemStart = normalize(rawStart);
          final itemEnd = normalize(itemStart + anglePerItem);

          itemRegions[i] = (itemStart, itemEnd);
        }

        final normalizedAngle = animation.value % (2 * pi); // 정규화된 각도
        final correctedAngle =
            normalize(pointerAngle - normalizedAngle); // 현재 각도

        // 화살표 (0, -1) 영역에 멈춰진 요소의 index 추출
        int? selectedIndex;
        for (var entry in itemRegions.entries) {
          final start = entry.value.$1;
          final end = entry.value.$2;

          if (start < end) {
            if (correctedAngle >= start &&
                correctedAngle < end &&
                end - correctedAngle <= anglePerItem) {
              selectedIndex = entry.key;
              break;
            }
          } else {
            // Wrap around case
            if (end > correctedAngle || start < correctedAngle) {
              selectedIndex = entry.key;
              break;
            }
          }
        }

        if (selectedIndex != null) {
          setSelectedItem(items[selectedIndex]);
        }

        onSpinComplete();
      }
    });

    controller.reset();
    controller.forward();
  }
}
