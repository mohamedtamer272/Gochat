import 'package:flutter/material.dart';
import 'colors.dart';

class MyThemeData {
  static ThemeData LightTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: ColorBlue,
      onPrimary: ColorBlack,
      background: Colors.transparent,
      onBackground: ColorBlack,
      error: Colors.red,
      onError: ColorWhite,
      secondary: ColorWhite,
      onSecondary: ColorBlack,
      surface: ColorWhite,
      onSurface: ColorBlack,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    drawerTheme: DrawerThemeData(
      width: 80,

    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorBlue,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          color: ColorWhite,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'),
      headline2: TextStyle(
          color: ColorGray,
          fontSize: 12,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins'),
      headline3: TextStyle(
          color: ColorBlack,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'),
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    colorScheme: ColorScheme(
      primary: ColorBlue,
      onPrimary: ColorWhite,
      background: Colors.transparent,
      onBackground: ColorWhite,
      error: Colors.red,
      onError: ColorWhite,
      secondary: ColorBlack,
      onSecondary: ColorWhite,
      surface: ColorBlack,
      onSurface: ColorWhite,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorBlue,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorBlack,
      selectedItemColor: ColorBlue,
      unselectedItemColor: ColorGray,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: ColorBlack,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(
        color: ColorBlue,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
