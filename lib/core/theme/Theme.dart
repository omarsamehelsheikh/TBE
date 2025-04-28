// lib/core/theme.dart
import 'package:flutter/material.dart';
import 'package:tbe/core/constants/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  hintColor: AppColors.secondary,
  scaffoldBackgroundColor: AppColors.background,
  cardColor: AppColors.error,
  textTheme: TextTheme(
    titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.onBackground),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.onBackground),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.primary,
    textTheme: ButtonTextTheme.primary,
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primary,
  hintColor: AppColors.secondary,
  scaffoldBackgroundColor: Colors.black,
);
