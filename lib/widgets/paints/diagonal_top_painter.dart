import 'package:flutter/material.dart';

class DiagonalCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.orange,
        Colors.orange.withOpacity(0.75),
        Colors.orange.withOpacity(0.5),
        Colors.orange.withOpacity(0.1),
      ],
    );
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    final path = Path()
      ..lineTo(size.width, size.height * 0.25)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DiagonalCustomPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DiagonalCustomPainter oldDelegate) => false;
}
