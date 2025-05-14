import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';
import 'package:theme_responsive_widget/common/widgets/loading_spinner.dart';
import 'package:theme_responsive_widget/common/widgets/switch_theme_button.dart';
import 'package:theme_responsive_widget/pages/login/form/login_form.dart';

class LoginPage extends StatefulWidget {
  final ThemeController themeController;

  const LoginPage({super.key, required this.themeController});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  toggleLoading() {
    setState(() => isLoading = !isLoading);
  }

  handleLoginFailed(BuildContext context) {
    toggleLoading();

    Future.delayed(const Duration(milliseconds: 2000)).then((_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ocorreu um erro! Verifique os campos.'),
            backgroundColor: ColorsConst.errorColor,
          ),
        );

        toggleLoading();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: ColorsConst.gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: LoginForm(
                  themeController: widget.themeController,
                  handleLoginFailed: handleLoginFailed,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SwitchThemeButton(controller: widget.themeController),
                ),
              ),

              if (isLoading) LoadingSpinner(),
            ],
          ),
        ),
      ),
    );
  }
}
