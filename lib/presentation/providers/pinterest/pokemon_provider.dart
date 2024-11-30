import 'package:fl_animaciones/core/actions/actions.dart';
import 'package:fl_animaciones/core/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonProvider = FutureProvider.family<Pokemon, int>((ref, id) async {
  return PokemonActions.getPokemonById(id);
});
