import 'package:flutter/material.dart';

import 'colors.dart';

final ThemeData appTheme = ThemeData(
  // La propiedad `primarySwatch` define la paleta de colores principal para la aplicación.
  // Flutter genera diferentes tonalidades de este color para la AppBar, botones, etc.
  //  primarySwatch: Colors.red,

  // `scaffoldBackgroundColor` establece el color de fondo por defecto de todos los Scaffolds.
  scaffoldBackgroundColor: AppColors.backgroundLight,
  fontFamily: 'Inter',

  // `floatingActionButtonTheme` permite personalizar la apariencia del FloatingActionButton.
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.amber, // Color de fondo del FAB.
    foregroundColor: Colors.black, // Color del icono o texto dentro del FAB.
  ),

  // `textTheme` te permite definir un conjunto de estilos de texto para usar
  // de forma consistente en toda la aplicación.
  textTheme: const TextTheme(
    // `headlineLarge` es un estilo para títulos grandes.
    headlineLarge: TextStyle(
      fontSize: 24.0, // Tamaño de la fuente.
      fontWeight: FontWeight.bold, // Grosor de la fuente.
      color: Colors.deepPurple, // Color del texto.
    ),

    // `bodyLarge` es un estilo para el cuerpo del texto principal.
    bodyLarge: TextStyle(
      fontSize: 16.0, // Tamaño de la fuente.
      color: Colors.black87, // Color del texto.
    ),
  ),
);
