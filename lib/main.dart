import 'dart:math';

import 'package:animations_app/models/layout_model.dart';
import 'package:animations_app/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeChanger(2)),
        ChangeNotifierProvider(create: (_) => LayoutModel()),
      ],
      child: const AppState(),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animations Playground App',
        //theme: ThemeData.dark(useMaterial3: true).copyWith(appBarTheme: const AppBarTheme(centerTitle: true)),
        theme: theme.currentTheme,
        themeAnimationCurve: Curves.bounceOut,
        themeAnimationDuration: const Duration(milliseconds: 600),
        home: const DemoTestPage()
        /* OrientationBuilder(builder: (context, orientation) {
        final screenSize = MediaQuery.of(context).size;
        if (screenSize.width > 500) {
          return const LauncherTabletPage();
        } else {
          return const LauncherPage();
        }
      }), */
        );
  }
}

class DemoTestPage extends StatelessWidget {
  const DemoTestPage({super.key});
  static const String route = '/DemoTest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DemoTest Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
            child: CustomPaint(
              painter: CircularItemPainter(),
            ),
          )
        ],
      ),
    );
  }
}

class CircularItemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final posiciones = [
      Offset(size.width, size.height * 0.5),
      Offset(size.width * 0.5, size.height),
      Offset(size.width * -0, size.height * 0.5),
      Offset(size.width * 0.5, size.height * -0),
    ];
    final line = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    final radius = min(size.width / 2, size.height / 2);

    final center = Offset(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);
    for (var offset in posiciones) {
      canvas.drawLine(center, offset, line);
    }
  }

  @override
  bool shouldRepaint(CircularItemPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CircularItemPainter oldDelegate) => false;
}
