import 'package:flutter/material.dart';

class DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.5)
      ..lineTo(size.width, size.height * 0.35)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TriangleHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width * 0.5, size.height * 0.55)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class PeakHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width * 0.5, size.height * 0.75)
      ..lineTo(size.width, size.height * 0.5)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RoundedHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.25,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, 0);

    final paint = Paint()
      ..color = Colors.blueAccent
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(RoundedHeaderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(RoundedHeaderPainter oldDelegate) => false;
}

class WaveHeaderPainter extends CustomPainter {
  WaveHeaderPainter({this.gradient}) : super();

  final Gradient? gradient;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..lineTo(0, size.height * 0.5)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.25,
        size.width * 0.5,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.75,
        size.width,
        size.height * 0.5,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
    final paint = Paint()
      ..color = Colors.green
      // ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    if (gradient != null) {
      final rect = Offset.zero & size;
      paint.shader = gradient!.createShader(rect);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(WaveHeaderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(WaveHeaderPainter oldDelegate) => false;
}
