import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class DarkTheme {
  ThemeData get themeData => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsConst.darkBgColor,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Color(0xFFD1B3FF),
        fontSize: 35,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 189, 189, 189),
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      labelMedium: TextStyle(
        color: ColorsConst.darkThemeLabelTextColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: ColorsConst.darkThemeInputColor,
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 104, 104, 118),
        fontSize: 14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsConst.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
