import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pokédex', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () => Get.toNamed("/http"),
              child: Text("HTTP", style: TextStyle(fontSize: 20),)),
               TextButton(
              onPressed: (){},
              child: Text("DIO", style: TextStyle(fontSize: 20),)),
               TextButton(
              onPressed: (){},
              child: Text("GetConnect", style: TextStyle(fontSize: 20),))
          ]
        ),
      ),
    );
  }
}