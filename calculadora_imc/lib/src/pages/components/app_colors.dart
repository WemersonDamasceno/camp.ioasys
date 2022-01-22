import 'package:flutter/material.dart';

class IMCCores {
  IMCCores._(); // this basically makes it so you can instantiate this class

  //FFCEE0

  static const pink = 0xFFC1007E;
  static const branco = 0xFFFFFFFF;

  static const MaterialColor primary = MaterialColor(
    pink,
    <int, Color>{
      50: Color(0xFFC1007E),
      100: Color(0xFFC1007E),
      200: Color(0xFFC1007E),
      300: Color(0xFFC1007E),
      400: Color(0xFFC1007E),
      500: Color(pink),
      600: Color(0xFFC1007E),
      700: Color(0xFFC1007E),
      800: Color(0xFFC1007E),
      900: Color(0xFFC1007E),
    },
  );

  static const MaterialColor teste = MaterialColor(
    branco,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
}
