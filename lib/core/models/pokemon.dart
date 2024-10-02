class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.avatar,
    required this.types,
    required this.sprites,
    required this.abilities,
  });

  final int id;
  final String name;
  final String avatar;
  final List<String> types;
  final List<String> sprites;
  final List<String> abilities;
}
