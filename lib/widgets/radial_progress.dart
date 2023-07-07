import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressAnimation extends StatefulWidget {
  const RadialProgressAnimation({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.orange,
    this.colorSecundario = Colors.white,
    this.grosorProgreso = 10,
    this.grosorFondo = 4,
    this.gradiente,
  });
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorProgreso;
  final double grosorFondo;
  final Gradient? gradiente;

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
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(10),
          child: CustomPaint(
            painter: _RadialProgressPainter(
              colorPrimario: widget.colorPrimario,
              colorSecundario: widget.colorSecundario,
              grosorPrimario: widget.grosorProgreso,
              grosorSecundario: widget.grosorFondo,
              gradient: widget.gradiente,
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
    required this.grosorPrimario,
    required this.grosorSecundario,
    this.gradient,
  });
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;
  final Gradient? gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // * Setup del circulo
    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);
    final paint = Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, paint);

    // * creacion del paint del arco
    final arcAngle = 2 * pi * (porcentaje / 100);
    final paintArco = Paint()
      ..strokeWidth = grosorPrimario
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
