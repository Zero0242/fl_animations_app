import 'dart:math';

import 'package:flutter/material.dart';

class GradientAnimation extends StatefulWidget {
  const GradientAnimation({super.key, required this.child});
  final Widget child;

  @override
  State<GradientAnimation> createState() => _GradientAnimationState();
}

class _GradientAnimationState extends State<GradientAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offset;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000))
      ..forward()
      ..repeat();
    _offset = Tween<double>(begin: 0, end: pi * 2).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: _AnimatedPainter(_offset.value),
          child: Center(child: widget.child),
        );
      },
    );
  }
}

class _AnimatedPainter extends CustomPainter {
  _AnimatedPainter(this.value2);
  final double value2;
  @override
  void paint(Canvas canvas, Size size) {
    Gradient gradient = LinearGradient(
      transform: GradientRotation(value2),
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: const [
        Colors.pink,
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.redAccent,
        Colors.green,
      ],
    );

    final rect = Rect.fromCircle(
        center: Offset(size.width * 0.5, size.height * 0.5), radius: 360);
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.85)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.75,
        size.width * 0.5,
        size.height * 0.85,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.95,
        size.width,
        size.height * 0.85,
      )
      ..lineTo(size.width, size.height)
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.25)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.15,
        size.width * 0.5,
        size.height * 0.25,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.35,
        size.width,
        size.height * 0.25,
      )
      ..lineTo(size.width, 0);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 20;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_AnimatedPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_AnimatedPainter oldDelegate) => false;
}
