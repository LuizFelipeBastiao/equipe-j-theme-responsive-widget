import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class LightTheme {
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsConst.lightBgColor,
    appBarTheme: const AppBarTheme(),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontFamily: 'Poppins',
        color: ColorsConst.lightTextColor,
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 109, 109, 109),
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConst.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 216, 216, 216),
      hintStyle: TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 134, 134, 134),
      ),
    ),
  );
}
