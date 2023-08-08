import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

// dark theme
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  hintColor: Colors.grey.shade700,
  cardColor: darkPrimaryColor,
  textTheme: GoogleFonts.ptSansTextTheme(ThemeData.dark().textTheme),
  appBarTheme: AppBarTheme(
      backgroundColor: darkScaffoldColor, scrolledUnderElevation: 0.0),
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
  hintColor: Colors.grey.shade400,
  cardColor: lightPrimaryColor,
  textTheme: GoogleFonts.ptSansTextTheme(ThemeData.light().textTheme),
  appBarTheme: AppBarTheme(
      backgroundColor: lightScaffoldColor, scrolledUnderElevation: 0.0),
  colorScheme: ColorScheme.fromSeed(
    seedColor: lightPrimaryColor,
    brightness: Brightness.light,
    secondary: lightSecondaryColor,
    background: lightScaffoldColor,
  ),
);
