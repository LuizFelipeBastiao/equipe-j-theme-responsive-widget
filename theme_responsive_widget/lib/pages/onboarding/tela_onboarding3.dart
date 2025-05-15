import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';
import 'package:theme_responsive_widget/pages/login/login_page.dart';

class TelaOnboarding3 extends StatefulWidget {
  final dynamic themeController;

  const TelaOnboarding3({super.key, required this.themeController});

  @override
  State<StatefulWidget> createState() => _TelaOnboarding3State();
}

class _TelaOnboarding3State extends State<TelaOnboarding3> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: ColorsConst.primaryColor,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 200),

            const Text(
              'Fique a vontade!',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 125),
            Lottie.asset(width: 150, 'assets/animations/thumbsup.json'),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Colors.white,
                shape:
                    theme.elevatedButtonTheme.style?.shape?.resolve({}) ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 70,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            LoginPage(themeController: widget.themeController),
                  ),
                );
              },
              child: const Text(
                'Logar',
                style: TextStyle(
                  color: ColorsConst.lightTextColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
