import 'package:consumindo_api_com_flutter/home/home_page.dart';
import 'package:consumindo_api_com_flutter/home/http/http_page.dart';
import 'package:consumindo_api_com_flutter/home/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: "/",
          page: () => const Welcomw(),
        
        )
      ],
    );
  }
}
// HomePage(), children: [
//             GetPage(name: "/http", page: () => HttpPage())
//           ]