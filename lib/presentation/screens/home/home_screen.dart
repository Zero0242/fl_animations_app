import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: OutlinedButton.icon(
          onPressed: () {
            ref.read(themeProvider.notifier).toggle();
          },
          label: const Text('Cambiar Tema'),
          icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
        ),
      ),
    );
  }
}
