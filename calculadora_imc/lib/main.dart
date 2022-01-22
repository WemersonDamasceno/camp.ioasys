import 'src/pages/home/home_navigation.dart';

import 'src/pages/login/login_page.dart';
import 'src/pages/splash/splash_page.dart';
import 'src/pages/components/app_colors.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: IMCCores.primary,
          secondaryVariant: const Color(0xFF9e9e9e),
          error: Colors.red,
        ),
        fontFamily: "Poppins",
        primarySwatch: IMCCores.primary,
        toggleableActiveColor: IMCCores.primary,
        iconTheme: const IconThemeData(color: IMCCores.primary),
        listTileTheme: const ListTileThemeData(
          iconColor: IMCCores.primary,
        ),
      ),
      home: const SplashPage(),
      initialRoute: "/",
      routes: {
        "/home": (context) => const HomeNavigationWidget(),
        "/login": (context) => const LoginPage(),
      },
    );
  }
}
