import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Load extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset(
        'assets/animations/load.json',
        width: 250,
        repeat: true,
      ),
    );
  }
}
