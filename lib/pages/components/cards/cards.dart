import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../service/pokemon.dart';
import 'card_animation.dart';

class Card extends StatelessWidget {
  final Pokemon data;

  const Card({required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card tap
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          decoration: BoxDecoration(
            color: getColorFromType(data.types[0].name),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${data.id}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      data.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/img/dots.png',
                      width: 74,
                      height: 32,
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: data.types.map((pokemonType) {
                        return Container(
                          key: Key(pokemonType.name!),
                          padding: const EdgeInsets.all(5),
                          width: 65,
                          height: 25,
                          decoration: BoxDecoration(
                            color: getColorFromType(pokemonType.name),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              pokemonType.name!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/img/pokeballCard.png',
                      alignment: Alignment.centerRight,
                    ),
                    CardAnimation(
                      child: Image.network(
                        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${data.id}.png',
                        width: 130,
                        height: 130,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColorFromType(String? type) {
    // Mapeie os tipos de Pokémon para cores desejadas
    // e retorne a cor correspondente com base no tipo fornecido.
    // Exemplo de mapeamento:
    switch (type) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      // Adicione mais casos conforme necessário.
      default:
        return Colors.grey;
    }
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