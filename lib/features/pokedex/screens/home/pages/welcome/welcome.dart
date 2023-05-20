import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../common/repositories/pokemon_repository.dart';
import '../../../../route.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        width: double.infinity,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: 0.523598,
                  child: Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 195, 22, 10),
                          borderRadius: BorderRadius.circular(100)),
                      child: Transform.rotate(
                          angle: -0.523598,
                          child: Lottie.asset("assets/animations/pokemon.json",
                              height: 200))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Bem Vindo",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 40, color: Colors.white)),
                SizedBox(
                  height: 20,
                ),
                Text("Encontre todos os pokemons em um só lugar",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                SizedBox(
                  height: 22,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PokedexRoute(
                                    repository:
                                        PokemonRepository(dio: Dio())))),
                        child: Text(
                          "Iniciar",
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(350, 60)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                        )),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
