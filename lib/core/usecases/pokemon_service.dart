import 'package:dio/dio.dart';

import '../models/models.dart';

class PokemonService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://pokeapi.co/api/v2',
    ),
  );

  static Future<Pokemon> getPokemonById(int id) async {
    final resp = await _dio.get<_PokemonResponse>('/pokemon/$id');
    final data = resp.data!;
    return Pokemon(
      id: id,
      name: data.name,
      avatar:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
      types: data.types.map((e) => e.type.name).toList(),
      sprites: [],
      abilities: data.abilities.map((e) => e.ability.name).toList(),
    );
  }
}

class _PokemonResponse {
  _PokemonResponse({
    required this.abilities,
    required this.baseExperience,
    required this.cries,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory _PokemonResponse.fromJson(Map<String, dynamic> json) =>
      _PokemonResponse(
        abilities: List<_Ability>.from(
          json["abilities"].map((x) => _Ability.fromJson(x)),
        ),
        baseExperience: json["base_experience"],
        cries: _Cries.fromJson(json["cries"]),
        forms:
            List<_Species>.from(json["forms"].map((x) => _Species.fromJson(x))),
        gameIndices: List<_GameIndex>.from(
          json["game_indices"].map((x) => _GameIndex.fromJson(x)),
        ),
        height: json["height"],
        heldItems: List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: List<_Move>.from(json["moves"].map((x) => _Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastAbilities: List<dynamic>.from(json["past_abilities"].map((x) => x)),
        pastTypes: List<dynamic>.from(json["past_types"].map((x) => x)),
        species: _Species.fromJson(json["species"]),
        sprites: _Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );
  final List<_Ability> abilities;
  final int baseExperience;
  final _Cries cries;
  final List<_Species> forms;
  final List<_GameIndex> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<_Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastAbilities;
  final List<dynamic> pastTypes;
  final _Species species;
  final _Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "cries": cries.toJson(),
        "forms": List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height,
        "held_items": List<dynamic>.from(heldItems.map((x) => x)),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "order": order,
        "past_abilities": List<dynamic>.from(pastAbilities.map((x) => x)),
        "past_types": List<dynamic>.from(pastTypes.map((x) => x)),
        "species": species.toJson(),
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}

class _Ability {
  _Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory _Ability.fromJson(Map<String, dynamic> json) => _Ability(
        ability: _Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );
  final _Species ability;
  final bool isHidden;
  final int slot;

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class _Species {
  _Species({
    required this.name,
    required this.url,
  });

  factory _Species.fromJson(Map<String, dynamic> json) => _Species(
        name: json["name"],
        url: json["url"],
      );
  final String name;
  final String url;

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class _Cries {
  _Cries({
    required this.latest,
    required this.legacy,
  });

  factory _Cries.fromJson(Map<String, dynamic> json) => _Cries(
        latest: json["latest"],
        legacy: json["legacy"],
      );
  final String latest;
  final String legacy;

  Map<String, dynamic> toJson() => {
        "latest": latest,
        "legacy": legacy,
      };
}

class _GameIndex {
  _GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory _GameIndex.fromJson(Map<String, dynamic> json) => _GameIndex(
        gameIndex: json["game_index"],
        version: _Species.fromJson(json["version"]),
      );
  final int gameIndex;
  final _Species version;

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex,
        "version": version.toJson(),
      };
}

class _Move {
  _Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory _Move.fromJson(Map<String, dynamic> json) => _Move(
        move: _Species.fromJson(json["move"]),
        versionGroupDetails: List<_VersionGroupDetail>.from(
          json["version_group_details"]
              .map((x) => _VersionGroupDetail.fromJson(x)),
        ),
      );
  final _Species move;
  final List<_VersionGroupDetail> versionGroupDetails;

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class _VersionGroupDetail {
  _VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory _VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: _Species.fromJson(json["move_learn_method"]),
        versionGroup: _Species.fromJson(json["version_group"]),
      );
  final int levelLearnedAt;
  final _Species moveLearnMethod;
  final _Species versionGroup;

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod.toJson(),
        "version_group": versionGroup.toJson(),
      };
}

class _GenerationV {
  _GenerationV({
    required this.blackWhite,
  });

  factory _GenerationV.fromJson(Map<String, dynamic> json) => _GenerationV(
        blackWhite: _Sprites.fromJson(json["black-white"]),
      );
  final _Sprites blackWhite;

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite.toJson(),
      };
}

class _GenerationIv {
  _GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory _GenerationIv.fromJson(Map<String, dynamic> json) => _GenerationIv(
        diamondPearl: _Sprites.fromJson(json["diamond-pearl"]),
        heartgoldSoulsilver: _Sprites.fromJson(json["heartgold-soulsilver"]),
        platinum: _Sprites.fromJson(json["platinum"]),
      );
  final _Sprites diamondPearl;
  final _Sprites heartgoldSoulsilver;
  final _Sprites platinum;

  Map<String, dynamic> toJson() => {
        "diamond-pearl": diamondPearl.toJson(),
        "heartgold-soulsilver": heartgoldSoulsilver.toJson(),
        "platinum": platinum.toJson(),
      };
}

class _Versions {
  _Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory _Versions.fromJson(Map<String, dynamic> json) => _Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: _GenerationIv.fromJson(json["generation-iv"]),
        generationV: _GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"])
            .map((k, v) => MapEntry<String, Home>(k, Home.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );
  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final _GenerationIv generationIv;
  final _GenerationV generationV;
  final Map<String, Home> generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;

  Map<String, dynamic> toJson() => {
        "generation-i": generationI.toJson(),
        "generation-ii": generationIi.toJson(),
        "generation-iii": generationIii.toJson(),
        "generation-iv": generationIv.toJson(),
        "generation-v": generationV.toJson(),
        "generation-vi": Map.from(generationVi)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "generation-vii": generationVii.toJson(),
        "generation-viii": generationViii.toJson(),
      };
}

class _Other {
  _Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
    required this.showdown,
  });

  factory _Other.fromJson(Map<String, dynamic> json) => _Other(
        dreamWorld: DreamWorld.fromJson(json["dream_world"]),
        home: Home.fromJson(json["home"]),
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
        showdown: _Sprites.fromJson(json["showdown"]),
      );
  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;
  final _Sprites showdown;

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld.toJson(),
        "home": home.toJson(),
        "official-artwork": officialArtwork.toJson(),
        "showdown": showdown.toJson(),
      };
}

class _Sprites {
  _Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
    required this.animated,
  });

  factory _Sprites.fromJson(Map<String, dynamic> json) => _Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
        other: _Other.fromJson(json["other"]),
        versions: _Versions.fromJson(json["versions"]),
        animated: _Sprites.fromJson(json["animated"]),
      );
  final String backDefault;
  final dynamic backFemale;
  final String backShiny;
  final dynamic backShinyFemale;
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;
  final _Other other;
  final _Versions versions;
  final _Sprites animated;

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
        "other": other.toJson(),
        "versions": versions.toJson(),
        "animated": animated.toJson(),
      };
}

class GenerationI {
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: RedBlue.fromJson(json["red-blue"]),
        yellow: RedBlue.fromJson(json["yellow"]),
      );
  final RedBlue redBlue;
  final RedBlue yellow;

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue.toJson(),
        "yellow": yellow.toJson(),
      };
}

class RedBlue {
  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) => RedBlue(
        backDefault: json["back_default"],
        backGray: json["back_gray"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontGray: json["front_gray"],
        frontTransparent: json["front_transparent"],
      );
  final String backDefault;
  final String backGray;
  final String backTransparent;
  final String frontDefault;
  final String frontGray;
  final String frontTransparent;

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_gray": backGray,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_gray": frontGray,
        "front_transparent": frontTransparent,
      };
}

class GenerationIi {
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal: Crystal.fromJson(json["crystal"]),
        gold: Gold.fromJson(json["gold"]),
        silver: Gold.fromJson(json["silver"]),
      );
  final Crystal crystal;
  final Gold gold;
  final Gold silver;

  Map<String, dynamic> toJson() => {
        "crystal": crystal.toJson(),
        "gold": gold.toJson(),
        "silver": silver.toJson(),
      };
}

class Crystal {
  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) => Crystal(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        backShinyTransparent: json["back_shiny_transparent"],
        backTransparent: json["back_transparent"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontShinyTransparent: json["front_shiny_transparent"],
        frontTransparent: json["front_transparent"],
      );
  final String backDefault;
  final String backShiny;
  final String backShinyTransparent;
  final String backTransparent;
  final String frontDefault;
  final String frontShiny;
  final String frontShinyTransparent;
  final String frontTransparent;

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "back_shiny_transparent": backShinyTransparent,
        "back_transparent": backTransparent,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_shiny_transparent": frontShinyTransparent,
        "front_transparent": frontTransparent,
      };
}

class Gold {
  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => Gold(
        backDefault: json["back_default"],
        backShiny: json["back_shiny"],
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
        frontTransparent: json["front_transparent"],
      );
  final String backDefault;
  final String backShiny;
  final String frontDefault;
  final String frontShiny;
  final String frontTransparent;

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_shiny": backShiny,
        "front_default": frontDefault,
        "front_shiny": frontShiny,
        "front_transparent": frontTransparent,
      };
}

class GenerationIii {
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald: OfficialArtwork.fromJson(json["emerald"]),
        fireredLeafgreen: Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: Gold.fromJson(json["ruby-sapphire"]),
      );
  final OfficialArtwork emerald;
  final Gold fireredLeafgreen;
  final Gold rubySapphire;

  Map<String, dynamic> toJson() => {
        "emerald": emerald.toJson(),
        "firered-leafgreen": fireredLeafgreen.toJson(),
        "ruby-sapphire": rubySapphire.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );
  final String frontDefault;
  final String frontShiny;

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );
  final String frontDefault;
  final dynamic frontFemale;
  final String frontShiny;
  final dynamic frontShinyFemale;

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class GenerationVii {
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons: DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: Home.fromJson(json["ultra-sun-ultra-moon"]),
      );
  final DreamWorld icons;
  final Home ultraSunUltraMoon;

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon.toJson(),
      };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );
  final String frontDefault;
  final dynamic frontFemale;

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class GenerationViii {
  GenerationViii({
    required this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons: DreamWorld.fromJson(json["icons"]),
      );
  final DreamWorld icons;

  Map<String, dynamic> toJson() => {
        "icons": icons.toJson(),
      };
}

class Stat {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: _Species.fromJson(json["stat"]),
      );
  final int baseStat;
  final int effort;
  final _Species stat;

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: _Species.fromJson(json["type"]),
      );
  final int slot;
  final _Species type;

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}
