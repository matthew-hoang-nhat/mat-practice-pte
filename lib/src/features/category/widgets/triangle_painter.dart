import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  TrianglePainter({required this.backgroundColor});
  final Color backgroundColor;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();
    final sSize = size.height;
    path.lineTo(sSize, 0);
    path.lineTo(sSize, sSize);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
