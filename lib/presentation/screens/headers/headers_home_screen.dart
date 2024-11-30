import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HeadersHomeScreen extends StatelessWidget {
  const HeadersHomeScreen({super.key});
  static const String route = '/headers';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Headers')),
      body: ListView(
        children: [
          HeaderDisplayContainer(
            title: 'Header Diagonal',
            customPainter: DiagonalHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Triangulo',
            customPainter: TriangleHeaderPainter(),
          ),
          const HeaderDisplayContainer(
            title: 'Header Pico',
          ),
          const HeaderDisplayContainer(
            title: 'Header Curvo',
          ),
          const HeaderDisplayContainer(
            title: 'Header Waves',
          ),
        ],
      ),
    );
  }
}

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
