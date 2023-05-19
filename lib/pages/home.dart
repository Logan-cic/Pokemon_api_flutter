import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../service/pokemon.dart';
import 'components/cards/card_animation.dart';
import 'components/cards/load.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));
      final decodedResponse = json.decode(response.body);
      final results = decodedResponse['results'];

      List<Pokemon> tempPokemons = [];
      for (var result in results) {
        final pokemonResponse = await http.get(Uri.parse(result['url']));
        final decodedPokemonResponse = json.decode(pokemonResponse.body);
        final pokemon = Pokemon.fromJson(decodedPokemonResponse);
        tempPokemons.add(pokemon);
      }

      setState(() {
        pokemons = tempPokemons;
        isLoading = false;
      });
    } catch (error) {
      print(error);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content:
                Text('Oops, something went wrong. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ME DA O EMPREGO FUDIDO'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return CardAnimation(
                  child: ListTile(
                    title: Text(pokemon.name),
                    subtitle: Text(
                        'ID: ${pokemon.id}, ${pokemon.types.map((type) => type.name).toList()}'),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      // Handle navigation to details screen
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Load(), // Adicione o componente Load ao final da tela
    );
  }
}
