import '../models/models.dart';

class PokemonActions {
  // static final Dio _dio = Dio(
  //   BaseOptions(
  //     baseUrl: 'https://pokeapi.co/api/v2',
  //   ),
  // );

  static Future<Pokemon> getPokemonById(int id) async {
    // final resp = await _dio.get('/pokemon/$id');
    // final data = PokemonResponse.fromJson(resp.data);
    return Pokemon(
      id: id,
      name: 'Bulbasaur',
      avatar:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
      types: [],
      abilities: [],
      sprites: [],
    );
  }
}
