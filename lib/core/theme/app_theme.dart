import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    fontFamily: 'Cairo',
  );
  
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      elevation: 0,
      centerTitle: true,
    ),
    fontFamily: 'Cairo',
  );
  
  // Yemeni theme colors
  static const Color yemeniRed = Color(0xFFCE1126);
  static const Color yemeniBlack = Color(0xFF000000);
  static const Color yemeniWhite = Color(0xFFFFFFFF);
  static const Color yemeniGreen = Color(0xFF00A859);
  
  // Custom text styles
  static TextStyle get arabicTitle => const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
  );
  
  static TextStyle get arabicBody => const TextStyle(
    fontSize: 16,
    fontFamily: 'Cairo',
  );
}
