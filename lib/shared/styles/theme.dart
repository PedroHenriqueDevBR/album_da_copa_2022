import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0XFF941B0C);
  static const Color secondaryColor = Color(0XFFFAA307);
  static const Color backgroundColor = Color(0XFFFFFFFF);
  static const Color dividerColor = Color(0XFF353535);

  static ThemeData get lightTheme => ThemeData(
        colorScheme: const ColorScheme.light(
          background: backgroundColor,
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        brightness: Brightness.light,
        appBarTheme: _customAppBarTheme,
        elevatedButtonTheme: _customElevatedButtonThemeData,
        textButtonTheme: _customTextButtonThemeData,
        // dividerColor: dividerColor,
      );

  static AppBarTheme get _customAppBarTheme => const AppBarTheme(
        toolbarHeight: 64,
        foregroundColor: Colors.white,
        elevation: 0,
      );

  static ElevatedButtonThemeData get _customElevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: secondaryColor,
          padding: const EdgeInsets.all(16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
        ),
      );

  static TextButtonThemeData get _customTextButtonThemeData =>
      TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
      );
}
