import 'package:flutter/material.dart';

// Colores de la aplicación

Color primaryColor = const Color.fromRGBO(13, 94, 207, 1);

Color secondaryColor = const Color.fromRGBO(255, 189, 73, 1);

Color terciaryColor = const Color.fromRGBO(54, 213, 161, 1);

Color appBarColor = Color.fromARGB(255, 255, 255, 255);

MaterialColor primarySwatchColor() {
  return createMaterialColor(primaryColor);
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

// Separador de los campos de texto

Divider divider() {
  return const Divider(
    color: Colors.grey,
    height: 2,
  );
}