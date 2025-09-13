import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Colors.black,
    ),
    centerTitle: false,
    elevation: 0,
    titleSpacing: 4,
  ),

  colorScheme: const ColorScheme.light(
    primary: Color(0xFF15B86C),
    secondary: Color(0xFF6D6D6D),
    background: Colors.white,
    onBackground: Colors.black,
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
    ),
    bodyLarge: TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 20,
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF15B86C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      textStyle: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      fixedSize: const Size(343, 40),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    filled: true,
    fillColor: Colors.grey[200],
    contentPadding: const EdgeInsets.all(16),
    hintStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Color(0xFF6D6D6D),
    ),
  ),

  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFF15B86C);
      }
      return Colors.grey;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const Color(0xFFB2F1D2);
      }
      return Colors.grey[400];
    }),
  ),

  dividerTheme: const DividerThemeData(
    color: Color(0xFFDDDDDD),
    thickness: 1,
    space: 1,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Colors.white,
    elevation: 4,
  ),
);
