import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PokemonDetailScreen extends ConsumerWidget {
  const PokemonDetailScreen({super.key, required this.id});
  static const String route = '/pinterest/:id';
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokeAsync = ref.watch(pokemonProvider(id));
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon Detalles')),
      body: Center(
        child: pokeAsync.when(
          data: (data) => Column(
            children: <Widget>[
              Text('Pokemon ${data.name}'),
              FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: data.avatar,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ],
          ),
          error: (error, stack) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Pokemon no encontrado: $error'),
              OutlinedButton(
                onPressed: () {
                  context.go(HomeScreen.route);
                },
                child: const Text('Volver'),
              ),
            ],
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
