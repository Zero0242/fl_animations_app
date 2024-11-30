import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});
  static const String route = '/acelerometer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAccelerometer$ = ref.watch(accelerometerUserProvider);
    final gravityAccelerometer$ = ref.watch(accelerometerGravityProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Acelerometro')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Row(),
          userAccelerometer$.when(
            data: (data) => Text(data.describe),
            error: (error, stackTrace) => Text("Error: $error"),
            loading: () => const CircularProgressIndicator(),
          ),
          gravityAccelerometer$.when(
            data: (data) => Text(data.describe),
            error: (error, stackTrace) => Text("Error: $error"),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
