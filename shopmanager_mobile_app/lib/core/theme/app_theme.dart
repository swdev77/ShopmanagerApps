import 'package:flutter/material.dart';

class AppTheme {
  static OutlineInputBorder _border() => OutlineInputBorder(
        // borderSide: const BorderSide(
        //   width: 2,
        // ),
        borderRadius: BorderRadius.circular(8),
      );
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.amber,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.amber,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );
}
