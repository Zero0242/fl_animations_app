import 'package:fl_animaciones/core/models/models.dart';
import 'package:fl_animaciones/core/usecases/usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonProvider = FutureProvider.family<Pokemon, int>((ref, id) async {
  return PokemonService.getPokemonById(id);
});
