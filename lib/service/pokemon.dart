import 'dart:convert';

import 'pokemon_types.dart';
import 'package:http/http.dart' as http;
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

Future<List<Pokemon>> fetchPokemons(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final results = data['results'] as List<dynamic>;
    List<Pokemon> pokemons = [];
    for (var result in results) {
      final pokemonUrl = result['url'] as String;
      final pokemonResponse = await http.get(Uri.parse(pokemonUrl));
      if (pokemonResponse.statusCode == 200) {
        final pokemonData = jsonDecode(pokemonResponse.body);
        final pokemon = Pokemon.fromJson(pokemonData);
        pokemons.add(pokemon);
      }
    }
    return pokemons;
  } else {
    throw Exception('Failed to fetch pokemons');
  }
}

// void main() {
//   final url = 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20';
//   fetchPokemons(url).then((pokemons) {
//     // Do something with the fetched pokemons
//     for (var pokemon in pokemons) {
//       print('Pokemon: ${pokemon.name}');
//       print('Types: ${pokemon.types.map((type) => type.name).toList()}');
//       print('---');
//     }
//   }).catchError((error) {
//     print('Error: $error');
//   });
// }