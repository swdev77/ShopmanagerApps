import 'package:flutter/material.dart';

class AppTheme {
  static ColorScheme _colorScheme() => ColorScheme.fromSeed(
        seedColor: Colors.orange,
      );
  static OutlineInputBorder _border() => OutlineInputBorder(
        // borderSide: const BorderSide(
        //   width: 2,
        // ),
        borderRadius: BorderRadius.circular(8),
      );
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme().copyWith(brightness: Brightness.light),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: _colorScheme().copyWith(brightness: Brightness.dark),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );
}
