import 'package:expense_tracker_sp26/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp( MaterialApp(
    theme: ThemeData(
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: kColorScheme.onSecondaryContainer
        )
      ),
      colorScheme: kColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: kColorScheme.onPrimaryContainer, 
        foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardThemeData(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer
          )
        )
    ),
    home: Expenses()
  ));
}
