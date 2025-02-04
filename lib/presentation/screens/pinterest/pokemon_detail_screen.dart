import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_animaciones/presentation/providers/providers.dart';
import 'package:fl_animaciones/presentation/screens/screens.dart';
import 'package:fl_animaciones/presentation/widgets/widgets.dart';
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
      appBar: const AnimatedAppBar(title: Text('Detalles')),
      body: Center(
        child: pokeAsync.when(
          data: (data) => Column(
            children: <Widget>[
              Text(data.name),
              SlideOffset(
                begin: const Offset(500, 0),
                end: const Offset(0, 0),
                child: HeartBeatAnimation(
                  child: CachedNetworkImage(
                    imageUrl: data.avatar,
                    height: 200,
                  ),
                ),
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
          loading: () => SkeletonContainer(
            height: 200,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
      ),
    );
  }
}
