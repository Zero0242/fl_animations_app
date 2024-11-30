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
          HeaderDisplayContainer(
            title: 'Header Pico',
            customPainter: PeakHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Curvo',
            customPainter: RoundedHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Header Waves',
            customPainter: WaveHeaderPainter(),
          ),
          HeaderDisplayContainer(
            title: 'Gradient Waves',
            customPainter: WaveHeaderPainter(
              gradient: const LinearGradient(
                colors: [
                  Color(0xff40E0D0),
                  Color(0xffFF8C00),
                  Color(0xffFF0080),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
