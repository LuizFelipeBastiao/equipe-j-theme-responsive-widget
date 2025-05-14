import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class LightTheme {
  ThemeData get themeData => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsConst.lightBgColor,
    appBarTheme: const AppBarTheme(),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: ColorsConst.lightTextColor,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConst.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 216, 216, 216),
      hintStyle: const TextStyle(
        fontSize: 14,
        color: Color.fromARGB(255, 134, 134, 134),
      ),
    ),
  );
}
