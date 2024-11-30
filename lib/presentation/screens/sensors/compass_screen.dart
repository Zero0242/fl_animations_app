import 'dart:math' as math;

import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});
  static const String route = '/compass';

  @override
  Widget build(BuildContext context, ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;
    final compassHeadings$ = ref.watch(compassProvider);
    if (!locationGranted) return const LocationPermisionView();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Compass', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: compassHeadings$.when(
          data: (data) => CompassComponent(heading: data ?? 0),
          error: (err, stack) =>
              Text('$err', style: const TextStyle(color: Colors.white)),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class CompassComponent extends StatefulWidget {
  const CompassComponent({super.key, required this.heading});
  final double heading;

  @override
  State<CompassComponent> createState() => _CompassComponentState();
}

class _CompassComponentState extends State<CompassComponent> {
  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {
    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction) : direction;

    double diff = direction - prevValue;
    if (diff.abs() > 180) {
      if (prevValue > direction) {
        diff = 360 - (direction - prevValue).abs();
      } else {
        diff = 360 - (prevValue - direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget.heading.toStringAsFixed(0),
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedRotation(
              turns: getTurns(),
              duration: const Duration(seconds: 1),
              child: Transform.rotate(
                angle: (widget.heading * (math.pi / 100) * -1),
                child: Image.asset('assets/images/quadrant-1.png'),
              ),
            ),
            Image.asset('assets/images/needle-3.png'),
          ],
        ),
      ],
    );
  }
}
