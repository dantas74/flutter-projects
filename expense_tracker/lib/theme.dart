import 'package:expense_tracker/constants.dart';
import 'package:flutter/material.dart';

class ExpenseTrackerTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData().copyWith(
      colorScheme: kLightColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kLightColorScheme.onPrimaryContainer,
        foregroundColor: kLightColorScheme.primaryContainer,
      ),
      cardTheme: const CardTheme().copyWith(
        color: kLightColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kLightColorScheme.primaryContainer,
          foregroundColor: kLightColorScheme.onPrimaryContainer,
        ),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.normal,
              color: kLightColorScheme.onSecondaryContainer,
              fontSize: 14,
            ),
          ),
    );
  }
}
