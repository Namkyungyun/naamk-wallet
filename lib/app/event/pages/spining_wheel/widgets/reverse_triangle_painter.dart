import 'package:flutter/material.dart';

class ReverseTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    return canvas.drawPath(
        Path()
          ..moveTo(size.width / 2, size.height / 1) // 시작 포인트
          ..lineTo(size.width / 2 / -1.6, 0) // 왼쪽
          ..lineTo(size.width / 2 / 0.4, 0) // 오른쪽
          ..lineTo(size.width / 2, size.height / 1) // 다시 시작 포인트
          ..close(),
        Paint()
          ..color = Colors.pinkAccent
          ..style = PaintingStyle.fill
          ..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(covariant ReverseTrianglePainter oldDelegate) {
    return true;
  }
}
