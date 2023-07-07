import 'package:animations_app/misc/circular_progress_page.dart';
import 'package:animations_app/widgets/diagonal_paint.dart';
import 'package:animations_app/widgets/wave_painter.dart';
import 'package:flutter/material.dart';

import '../widgets/wave_gradient_painter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Playground')),
      body: ListView(
        children: [
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.orange,
            child: Center(
              child: ElevatedButton(
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CircularProgressPage(),
                        ),
                      ),
                  child: const Text('Go to test page')),
            ),
          ),
          SizedBox(height: size.height / 36),
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.orange,
            child: CustomPaint(
              painter: CurvedPainterGradient(),
              child: const Center(
                child: Text(
                  'Este es un painter con gradiente',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.orange,
            child: CustomPaint(
              painter: WavedPainter(),
              child: const Center(
                child: Text(
                  'Este es un painter con curvas',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.orange,
            child: CustomPaint(
              painter: DiagonalPainter(),
              child: const Center(
                child: Text(
                  'Este es un painter con diagonales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
        ],
      ),
    );
  }
}
