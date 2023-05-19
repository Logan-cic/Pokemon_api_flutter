import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcomw extends StatefulWidget {
  const Welcomw({super.key});

  @override
  State<Welcomw> createState() => _WelcomwState();
}

class _WelcomwState extends State<Welcomw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color(0xFF58ABF6),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        color:  Color(0xFF4A90DA),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Transform.rotate(
                        angle: -0.523598,
                        child: Lottie.asset("assets/animations/pokemon.json", height: 200))
                    ),
                  ),
                    SizedBox(height: 20,),
    
                   Text("Bem Vindo", textAlign: TextAlign.justify, style: TextStyle(fontSize: 40, color: Colors.white)),
                    SizedBox(height: 20,),
                    Text("Encontre todos os pokemons em um só lugar", textAlign: TextAlign.justify, style: TextStyle(fontSize: 18, color: Colors.white))
                    ,SizedBox(height: 22,),
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
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     ElevatedButton(
                      onPressed: () {},
                      child: Text("Iniciar", style: TextStyle(fontSize: 18),),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(350, 60)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                          backgroundColor: MaterialStateProperty.all(Color(0xFF4A90DA)),
                        )
                      ),
                    ]
                  ),
                ),
              ),
            ]
          ),
        ),
    );
  }
}