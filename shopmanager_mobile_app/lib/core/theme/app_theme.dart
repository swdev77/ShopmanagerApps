import 'package:flutter/material.dart';
import 'package:shopmanager_mobile_app/core/theme/app_colors.dart';

class AppTheme {
  static OutlineInputBorder _border() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      );
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.seedColor,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    colorSchemeSeed: AppColors.seedColor,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      enabledBorder: _border(),
      focusedBorder: _border(),
    ),
  );
}
