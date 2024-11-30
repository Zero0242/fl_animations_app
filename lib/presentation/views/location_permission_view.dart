import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocationPermisionView extends ConsumerWidget {
  const LocationPermisionView({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permiso Requerido'),
      ),
      body: Center(
        child: FilledButton(
          child: const Text('Localización Necesaria'),
          onPressed: () {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
      ),
    );
  }
}
