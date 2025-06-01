import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/theme/app_colors.dart';

class AppTheme {
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.seedColor,
    primary: AppColors.seedColor,
    brightness: Brightness.light,
  );
  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.seedColor,
    primary: AppColors.seedColor,
    brightness: Brightness.dark,
  );

  static OutlineInputBorder _border({required Color color}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: color,
          width: 2.0,
        ),
      );

  static FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size.fromHeight(56),
    ),
  );

  static final lightThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(color: lightColorScheme.tertiary),
      focusedBorder: _border(color: lightColorScheme.primary),
    ),
    filledButtonTheme: filledButtonThemeData,
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(color: darkColorScheme.tertiary),
      focusedBorder: _border(color: darkColorScheme.primary),
    ),
    filledButtonTheme: filledButtonThemeData,
  );
}
