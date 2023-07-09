import 'package:flutter/material.dart';

class DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      // * Props
      ..color = const Color(0xff615aab)
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;
    // * Direccion del lapiz
    final Path path = Path()
      // * Props
      ..lineTo(0, size.height * 0.2)
      ..lineTo(size.width * 0.5, size.height * 0.25)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(DiagonalPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(DiagonalPainter oldDelegate) => false;
}
