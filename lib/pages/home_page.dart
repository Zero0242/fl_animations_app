import 'package:animations_app/pages/graficas_circulaes.dart';
import 'package:animations_app/pages/pinterest_page.dart';
import 'package:animations_app/widgets/diagonal_paint.dart';
import 'package:animations_app/widgets/wave_painter.dart';
import 'package:flutter/material.dart';

import '../widgets/wave_gradient_painter.dart';
import 'slideshow_page.dart';

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
            child: CustomPaint(
              painter: CurvedPainterGradient(),
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GraficasCirculasPage(),
                    ),
                  ),
                  child: const Text('Go to animated progress'),
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
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SlideShowPage(),
                    ),
                  ),
                  child: const Text('Go to Slide Show'),
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
              child: Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const PinterestPage(),
                    ),
                  ),
                  child: const Text('Go to pinterest page'),
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
