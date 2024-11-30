import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});
  static const String route = '/animation-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animaciones')),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularAnimation(),
            CircularAnimation(delay: Duration(milliseconds: 500)),
            CircularAnimation(delay: Duration(milliseconds: 1000)),
            CircularAnimation(delay: Duration(milliseconds: 1500)),
          ],
        ),
      ),
    );
  }
}
