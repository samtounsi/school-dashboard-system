import 'package:flutter/material.dart';

class AppColors {
  static const darkBlue = Color(0xFF295087);
  static const aqua = Color(0xFFA6CDCA);
  static const lightOrange = Color(0xFFF0B976);
  static const backgroundcolor = Color(0xFFF0EDED);
  static const circlegreyColor = Color(0xff89AFAF);
  static const darkAqua = Color(0xFF3A968E);
  static const Color holidayBlue = Color.fromARGB(197, 63, 107, 169);
  static const borderColor = Color(0xFFF0EDED);
}

const double webFont = 20;

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

String? token;
String? type;

