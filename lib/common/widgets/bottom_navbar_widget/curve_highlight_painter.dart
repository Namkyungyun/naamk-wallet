import 'package:naamk_wallet/config/di/ui_common_module.dart';

class CurveHighlightPainter extends CustomPainter {
  final Color backgroundColor;
  final Color borderColor;
  final double centerX;
  final double curveWidth;

  CurveHighlightPainter({
    required this.centerX,
    required this.curveWidth,
    required this.backgroundColor,
    required this.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = borderColor // ✅ 테두리 색상
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8; // ✅ 테두리 두께

    const highlightHeight = -25.0;

    final path = Path();

    path.moveTo(0, 0);
    path.lineTo(centerX - curveWidth, 0);

    path.quadraticBezierTo(
      centerX,
      highlightHeight, // 튀어나온 곡선 높이
      centerX + curveWidth,
      0,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // 배경 먼저 채우기
    canvas.drawPath(path, fillPaint);

    // ✅ 위쪽 선분만 따로 path 정의
    final topBorderPath = Path();
    topBorderPath.moveTo(0, 0);
    topBorderPath.lineTo(centerX - curveWidth, 0);
    topBorderPath.quadraticBezierTo(
      centerX,
      highlightHeight,
      centerX + curveWidth,
      0,
    );
    topBorderPath.lineTo(size.width, 0);

    // 테두리 그리기
    canvas.drawPath(topBorderPath, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
