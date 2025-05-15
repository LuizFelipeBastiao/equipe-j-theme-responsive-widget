import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';
import 'package:theme_responsive_widget/common/widgets/switch_theme_button.dart';

class HomePage extends StatelessWidget {
  final ThemeController themeController;
  const HomePage({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    final theme = themeController.themeNotifier.value;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConst.primaryColor,
          title: const Text(
            'Home Page',
            style: TextStyle(
              color: ColorsConst.whiteTextColor,
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: SwitchThemeButton(controller: themeController),
            ),
          ],
        ),
        body: Center(
          child: Text('Home Page', style: theme.textTheme.bodyMedium),
        ),
      ),
    );
  }
}
