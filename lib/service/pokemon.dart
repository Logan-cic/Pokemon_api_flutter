import 'pokemon_types.dart';

class Pokemon {
  final String name;
  final String url;
  final int id;
  final List<PokemonType> types;

  Pokemon({
    required this.name,
    required this.url,
    required this.id,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<PokemonType> typesList = [];
    final types = json['types'];
    if (types != null && types is List) {
      for (var type in types) {
        typesList.add(PokemonType.fromJson(type));
      }
    }
    return Pokemon(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      id: json['id'] ?? 0,
      types: typesList,
    );
  }
}
