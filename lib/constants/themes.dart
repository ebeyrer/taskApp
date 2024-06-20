import 'package:flutter/material.dart';
import 'package:task_app/constants/hd_colors.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: HDColors.lemonLight,
  hintColor: HDColors.raspberryLight,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: HDColors.blueberryLight,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: HDColors.grapeLight),
    bodyLarge: TextStyle(color: HDColors.black),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: HDColors.limeLight,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(HDColors.mangoLight),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: HDColors.lemonDark,
  hintColor: HDColors.raspberryDark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 191, 171, 171),
  appBarTheme: const AppBarTheme(
    color: HDColors.blueberryDark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: HDColors.grapeDark),
    bodyLarge: TextStyle(color: HDColors.white),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: HDColors.limeDark,
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all(HDColors.raspberryDark),
  ),
);
