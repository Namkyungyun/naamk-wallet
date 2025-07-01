import 'dart:math';

import 'package:flutter/material.dart';

class WheelPainter extends CustomPainter {
  final List<String> items;
  WheelPainter(this.items);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final textPainter = TextPainter(
        textAlign: TextAlign.center, textDirection: TextDirection.ltr);
    final radius = size.width / 2;
    final center = Offset(radius, radius);
    final anglePerItem = 2 * pi / items.length;

    for (int i = 0; i < items.length; i++) {
      paint.color = Colors.primaries[i % Colors.primaries.length];
      final startAngle = anglePerItem * i - pi / 2 + anglePerItem / 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        anglePerItem,
        true,
        paint,
      );

      final textAngle = startAngle + anglePerItem / 2;
      final textOffset = Offset(
        center.dx + cos(textAngle) * radius * 0.6,
        center.dy + sin(textAngle) * radius * 0.6,
      );

      textPainter.text = TextSpan(
        text: items[i],
        style: const TextStyle(color: Colors.white, fontSize: 14),
      );
      textPainter.layout();
      canvas.save();
      canvas.translate(textOffset.dx, textOffset.dy);
      canvas.rotate(textAngle);
      textPainter.paint(
          canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
