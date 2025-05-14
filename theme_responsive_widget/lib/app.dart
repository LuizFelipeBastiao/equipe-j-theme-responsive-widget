import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';
import 'package:theme_responsive_widget/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  final ThemeController themeController = ThemeController();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: themeController.themeNotifier,
      builder: (context, theme, _) {
        return MaterialApp(
          title: 'Flutter Temas com Classes',
          theme: theme,
          initialRoute: '/login',
          routes: {
            '/login': (context) => LoginPage(themeController: themeController),
          },
        );
      },
    );
  }
}
