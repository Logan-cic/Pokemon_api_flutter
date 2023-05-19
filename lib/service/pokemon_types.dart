class PokemonType {
  final String? name;

  PokemonType({required this.name});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    final typeName = json['type']?['name'] as String?;
    if (typeName != null) {
      return PokemonType(name: typeName);
    } else {
      throw Exception('Invalid type name');
    }
  }
}