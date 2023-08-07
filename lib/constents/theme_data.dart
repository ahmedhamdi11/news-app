import 'package:flutter/material.dart';
import 'app_colors.dart';

// dark theme
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  hintColor: Colors.grey.shade700,
  cardColor: darkPrimaryColor,
  appBarTheme: AppBarTheme(backgroundColor: darkScaffoldColor),
  colorScheme: ColorScheme.fromSeed(
    seedColor: darkPrimaryColor,
    brightness: Brightness.dark,
    secondary: darkSecondaryColor,
    background: darkScaffoldColor,
  ),
);

// light theme
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  hintColor: Colors.grey.shade700,
  cardColor: darkPrimaryColor,
  appBarTheme: AppBarTheme(backgroundColor: lightScaffoldColor),
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightPrimaryColor,
    brightness: Brightness.light,
    secondary: lightSecondaryColor,
    background: lightScaffoldColor,
  ),
);
