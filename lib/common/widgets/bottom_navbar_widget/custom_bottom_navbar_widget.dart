import 'dart:io';

import 'package:naamk_wallet/common/widgets/bottom_navbar_widget/curve_highlight_painter.dart';
import 'package:naamk_wallet/config/presentation/ui_common_module.dart';
import 'package:naamk_wallet/config/presentation/theme/app_color.dart';

class CustomBottomNavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final List<IconData> icons;
  final List<String> labels;

  const CustomBottomNavbarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.icons,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    final bottomHeight = Platform.isIOS ? 110.0 : 95.0;
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / icons.length;
    final centerX = itemWidth * (selectedIndex + 0.5);
    final backgroundColor =
        Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
            AppColor.grey10;
    final borderColor = Theme.of(context).dividerColor;

    // AppColor.grey60
    return Stack(
      // 서울 자가에 대기업 다니는 김 부장 이야기
      clipBehavior: Clip.none,
      children: [
        /// 🎨 곡선 하이라이트
        CustomPaint(
          size: Size(screenWidth, bottomHeight),
          painter: CurveHighlightPainter(
            centerX: centerX,
            curveWidth: itemWidth / 2,
            borderColor: borderColor,
            backgroundColor: backgroundColor,
          ),
        ),

        /// 🔘 탭 아이템들
        SizedBox(
          height: bottomHeight,
          child: Row(
            children: List.generate(icons.length, (index) {
              final isActive = index == selectedIndex;
              final iconColor = isActive
                  ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor;
              final bgColor =
                  isActive ? Theme.of(context).focusColor : Colors.transparent;

              return Expanded(
                child: GestureDetector(
                  onTap: () => onTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// 🌀 커지는 원형 + 아이콘
                      AnimatedScale(
                        scale: isActive ? 1.1 : 1.0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutBack,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: itemWidth * 0.7,
                          height: itemWidth * 0.7,
                          decoration: BoxDecoration(
                            color: bgColor,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            icons[index],
                            color: iconColor,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// ✨ 텍스트 스타일 애니메이션
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 250),
                        style: TextStyle(
                          fontSize: isActive ? 14 : 12,
                          fontWeight:
                              isActive ? FontWeight.w700 : FontWeight.w400,
                          color: iconColor,
                        ),
                        child: Text(
                          key: ValueKey(context.locale.languageCode),
                          labels[index].tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
