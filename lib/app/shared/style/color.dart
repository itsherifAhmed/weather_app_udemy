import 'package:flutter/material.dart';

class AppColors {
  static const Brightness brightnessLight=Brightness.light;
  static const Brightness brightnessDark=Brightness.dark;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color transparent = Colors.transparent;

  static const Color mediumBlack = Color(0xFF111111);
  static const Color lightBlack = Color(0xFF282828);

  static const Color lightGray_1 = Color(0xFFF8F8F8);
  static const Color lightGray_2 = Color(0xFFC5CAD3);

  static const MaterialColor green = MaterialColor(0xFF3AB472, greenMaterial);

  static const Map<int, Color> greenMaterial = <int, Color>{
    50: Color.fromRGBO(58, 180, 114, .1),
    100: Color.fromRGBO(58, 180, 114, .2),
    200: Color.fromRGBO(58, 180, 114, .3),
    300: Color.fromRGBO(58, 180, 114, .4),
    400: Color.fromRGBO(58, 180, 114, .5),
    500: Color.fromRGBO(58, 180, 114, .6),
    600: Color.fromRGBO(58, 180, 114, .7),
    700: Color.fromRGBO(58, 180, 114, .8),
    800: Color.fromRGBO(58, 180, 114, .9),
    900: Color.fromRGBO(58, 180, 114, 1),
  };
}
