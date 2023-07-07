import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  double porcentaje = 0;
  double nuevoPorcentaje = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() => porcentaje = lerpDouble(
              porcentaje,
              nuevoPorcentaje,
              _controller.value,
            )!);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Paint')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          _controller.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(Icons.refresh, color: Colors.orange),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 200,
          width: 200,
          child: CustomPaint(
            painter: _RadialProgressPainter(porcentaje: porcentaje.toInt()),
          ),
        ),
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({required this.porcentaje});
  final int porcentaje;

  @override
  void paint(Canvas canvas, Size size) {
    // * Setup del circulo
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.white
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paint);

    // * creacion del paint del arco
    final arcAngle = 2 * pi * (porcentaje / 100);
    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.orange
      ..style = PaintingStyle.stroke;
    // * Dibujado del arco, el rect es donde va a ir pintado
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(_RadialProgressPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_RadialProgressPainter oldDelegate) => false;
}
