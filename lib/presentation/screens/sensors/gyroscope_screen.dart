import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GyroscopeScreen extends ConsumerWidget {
  const GyroscopeScreen({super.key});
  static const String route = '/gyroscope';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Gyroscope')),
      body: Center(
        child: gyroscope.when(
          data: (data) => Text(data.toString()),
          error: (error, stackTrace) => Text('Error: $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
