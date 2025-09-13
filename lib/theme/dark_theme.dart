import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF181818),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF181818),
    iconTheme: IconThemeData(color: Color(0xFFFFFCFC)),
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 20,
      color: Color(0xFFFFFCFC),
    ),
    centerTitle: false,
    elevation: 0,
    titleSpacing: 4,
  ),

  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF15B86C),
    secondary: Color(0xFF6D6D6D),
    background: Color(0xFF181818),
    onBackground: Colors.white,
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
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
    fillColor: Colors.black,
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
        return const Color(0xFF0F5132);
      }
      return Colors.grey[700];
    }),
  ),

  dividerTheme: const DividerThemeData(
    color: Color(0xFF3A3A3A),
    thickness: 1,
    space: 1,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF15B86C),
    foregroundColor: Colors.white,
    elevation: 4,
  ),
);
