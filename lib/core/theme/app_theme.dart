import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:fitness_app/core/theme/app_typografy.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppConstants.authBackground,
    textTheme: AppTypography.textTheme,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF896CFE),
      secondary: Color(0xFFE2F163),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppConstants.authAccent,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: AppConstants.authAccent,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: AppTypography.textTheme,
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF896CFE),
      secondary: Color(0xFFE2F163),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppConstants.authAccent,
        size: 24,
      ),
      titleTextStyle: TextStyle(
        color: AppConstants.authAccent,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
