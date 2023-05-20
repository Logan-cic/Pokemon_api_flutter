import 'package:consumindo_api_com_flutter/features/pokedex/screens/home/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POKÉDEX',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Welcome() 
    );
  }
}
