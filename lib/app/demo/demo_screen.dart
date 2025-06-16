import 'dart:math' as math;

import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});
  static const String route = '/demo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Painter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(width: double.infinity),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: CustomPaint(
              painter: CircularItemPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularItemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final posiciones = [
      Offset(size.width, size.height * 0.5),
      Offset(size.width * 0.5, size.height),
      Offset(size.width * -0, size.height * 0.5),
      Offset(size.width * 0.5, size.height * -0),
    ];
    final line = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final radius = math.min(size.width / 2, size.height / 2);

    final center = Offset(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);
    for (var offset in posiciones) {
      canvas.drawLine(center, offset, line);
    }
  }

  @override
  bool shouldRepaint(CircularItemPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CircularItemPainter oldDelegate) => false;
}
