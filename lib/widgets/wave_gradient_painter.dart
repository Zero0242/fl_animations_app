import 'package:flutter/material.dart';

class CurvedPainterGradient extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // * Añadir gradiente al painter
    const Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff6d05c8), Color(0xffc012ff), Color(0xff6d05fa)],
    );
    // * Añadir este valor para crear el shader
    final Rect rect = Rect.fromCircle(center: const Offset(0, 75), radius: 180);
    // * La pintura principal
    final Paint paint = Paint()
      // * Props
      ..style = PaintingStyle.fill
      ..shader = gradient.createShader(rect)
      ..strokeWidth = 20;
    // * Direccion del lapiz
    final Path path = Path()
      // * Props
      ..lineTo(0, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.3,
          size.width * 0.5, size.height * 0.2)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.1, size.width, size.height * 0.2)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedPainterGradient oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CurvedPainterGradient oldDelegate) => false;
}
