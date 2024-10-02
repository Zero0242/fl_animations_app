import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressAnimation extends StatefulWidget {
  const RadialProgressAnimation({
    super.key,
    required this.porcentaje,
    this.primaryColor = Colors.orange,
    this.secondaryColor = Colors.white,
    this.progressBarThickness = 10,
    this.backgroundThickness = 4,
    this.gradient,
  });
  final double porcentaje;
  final Color primaryColor;
  final Color secondaryColor;
  final double progressBarThickness;
  final double backgroundThickness;
  final Gradient? gradient;

  @override
  State<RadialProgressAnimation> createState() =>
      _RadialProgressAnimationState();
}

class _RadialProgressAnimationState extends State<RadialProgressAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _controller.forward(from: 0.0);
    porcentajeAnterior = widget.porcentaje;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? _) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: CustomPaint(
            painter: _RadialProgressPainter(
              colorPrimario: widget.primaryColor,
              colorSecundario: widget.secondaryColor,
              progressBarThickness: widget.progressBarThickness,
              backgroundThickness: widget.backgroundThickness,
              gradient: widget.gradient,
              porcentaje: (widget.porcentaje - diferenciaAnimar) +
                  (diferenciaAnimar * _controller.value),
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  _RadialProgressPainter({
    required this.porcentaje,
    required this.colorPrimario,
    required this.colorSecundario,
    required this.progressBarThickness,
    required this.backgroundThickness,
    this.gradient,
  });
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double progressBarThickness;
  final double backgroundThickness;
  final Gradient? gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // * Setup del circulo
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);
    final paint = Paint()
      ..strokeWidth = backgroundThickness
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paint);

    // * creacion del paint del arco
    final arcAngle = 2 * pi * (porcentaje / 100);
    final paintArco = Paint()
      ..strokeWidth = progressBarThickness
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    if (gradient != null) {
      final rect = Rect.fromCircle(center: const Offset(0, 0), radius: 180);
      paintArco.shader = gradient?.createShader(rect);
    } else {
      paintArco.color = colorPrimario;
    }
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
