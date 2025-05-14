import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/themes/dark_theme.dart';
import 'package:theme_responsive_widget/common/themes/light_theme.dart';

class ThemeController {
  static final ThemeData light = LightTheme().themeData;
  static final ThemeData dark = DarkTheme().themeData;

  final ValueNotifier<ThemeData> themeNotifier;

  ThemeController({bool isDarkMode = false})
    : themeNotifier = ValueNotifier(isDarkMode ? dark : light);

  void toggleTheme() {
    bool isDark = themeNotifier.value.brightness == Brightness.dark;
    themeNotifier.value = isDark ? light : dark;
  }
}
