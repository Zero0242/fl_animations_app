import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});
  static const String route = '/magnetometer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometro$ = ref.watch(magnetometerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Magnetometro')),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Row(),
          magnetometro$.when(
            data: (data) => Text(data.describe),
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
