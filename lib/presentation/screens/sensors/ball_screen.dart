import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GyroscopeBallScreen extends ConsumerWidget {
  const GyroscopeBallScreen({super.key});
  static const String route = '/gyro-bola';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Gyroscope Ball')),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data: (data) => MovinBall(x: data.x, y: data.y),
          error: (error, stackTrace) => Text("Error $error"),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class MovinBall extends StatelessWidget {
  const MovinBall({super.key, required this.x, required this.y});

  final double x;
  final double y;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final currentYPos = (y * 100);
    final currentXPos = (x * 100);
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedPositioned(
          left: (currentYPos - 25) + (width / 2),
          top: (currentXPos - 25) + (height / 2),
          curve: Easing.standard,
          duration: const Duration(milliseconds: 1000),
          child: Container(
            height: kBottomNavigationBarHeight,
            width: kBottomNavigationBarHeight,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Text('X: $x, Y: $y'),
      ],
    );
  }
}
