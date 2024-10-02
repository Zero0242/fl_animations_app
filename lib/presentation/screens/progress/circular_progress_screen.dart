import 'package:fl_animaciones/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CircularProgressScreen extends ConsumerWidget {
  const CircularProgressScreen({super.key});
  static const String route = '/circular-progress';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final porcentaje = ref.watch(_progressProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Progreso circular'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(_progressProvider.notifier).update,
        child: const Icon(Icons.refresh, color: Colors.orange),
      ),
      body: _builder(
        isLarge: MediaQuery.of(context).size.height > 500,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(porcentaje: porcentaje),
              _CustomRadialProgress(porcentaje: porcentaje),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _CustomRadialProgress(porcentaje: porcentaje),
              _CustomRadialProgress(porcentaje: porcentaje),
            ],
          ),
        ],
      ),
    );
  }

  Widget _builder({required bool isLarge, required List<Widget> children}) {
    if (isLarge) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
    return ListView(children: children);
  }
}

class _CustomRadialProgress extends StatelessWidget {
  const _CustomRadialProgress({required this.porcentaje});

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 180,
      child: RadialProgressAnimation(
        porcentaje: porcentaje,
        primaryColor: Colors.blue,
        gradient: const LinearGradient(
          colors: [
            Color(0xffc012ff),
            Color(0xff6d05e8),
            Colors.red,
          ],
        ),
      ),
    );
  }
}

// Gestor de estado
final _progressProvider =
    AutoDisposeNotifierProvider<_ProgressNotifier, double>(
  _ProgressNotifier.new,
);

class _ProgressNotifier extends AutoDisposeNotifier<double> {
  @override
  double build() {
    return 0.0;
  }

  void update() {
    if (state >= 100) {
      state = 0;
    } else {
      state += 10;
    }
  }
}
