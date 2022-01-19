import 'package:calculadora_imc/src/pages/login/login_page.dart';
import 'package:calculadora_imc/src/pages/splash/splash_page.dart';
import 'package:calculadora_imc/src/pages/widgets/app_colors.dart';
import 'package:flutter/material.dart';

import 'src/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: IMCCores.primary,
      ),
      home: const SplashPage(),
      initialRoute: "/",
      routes: {
        "/home": (context) => const HomePage(),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}
