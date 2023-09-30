
import 'package:flutter/material.dart';


class TrianglePainter extends CustomPainter {
  final Color triangleColor;

  TrianglePainter(this.triangleColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = triangleColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

