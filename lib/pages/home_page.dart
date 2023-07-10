import 'package:animations_app/pages/do_page/index_page.dart';
import 'package:animations_app/pages/emergency/emergency_page.dart';
import 'package:animations_app/pages/progress/graficas_circulaes.dart';
import 'package:animations_app/pages/pinterest/pinterest_page.dart';
import 'package:animations_app/pages/sliver/sliverdemo_page.dart';
import 'package:animations_app/widgets/paints/diagonal_paint.dart';
import 'package:animations_app/widgets/paints/wave_painter.dart';
import 'package:flutter/material.dart';

import '../widgets/paints/animated_painter.dart';
import '../widgets/paints/wave_gradient_painter.dart';
import 'slideshow/slideshow_page.dart';

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
            color: Colors.black45,
            child: const GradientAnimation(
              colors: [Colors.black, Colors.white],
              child: Center(
                child: FlutterLogo(),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.black45,
            child: GradientAnimation(
              duration: const Duration(milliseconds: 2500),
              colors: const [
                Colors.green,
                Colors.deepPurple,
                Colors.blue,
                Colors.red,
                Colors.blueGrey,
                Colors.yellow,
                Colors.deepOrange
              ],
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const BasicsAnimationPage(),
                  ),
                ),
                child: const Text("Go to new page"),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.black45,
            child: GradientAnimation(
              colors: [
                Colors.deepOrange,
                Colors.deepOrangeAccent,
                Colors.orange,
                Colors.orange.withOpacity(0.8),
                Colors.orangeAccent,
              ],
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SliverDemoPage(),
                  ),
                ),
                child: const Text("Go to sliver page"),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
          Container(
            height: size.height - kBottomNavigationBarHeight,
            width: size.width,
            color: Colors.black45,
            child: GradientAnimation(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const EmergengyPage(),
                  ),
                ),
                child: const Text('Go to emergency page'),
              ),
            ),
          ),
          SizedBox(height: size.height / 36),
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
