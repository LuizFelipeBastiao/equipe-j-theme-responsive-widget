import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';
import 'package:theme_responsive_widget/common/widgets/loading_spinner.dart';
import 'package:theme_responsive_widget/common/widgets/switch_theme_button.dart';
import 'package:theme_responsive_widget/data/user_dao.dart';
import 'package:theme_responsive_widget/models/user_model.dart';
import 'package:theme_responsive_widget/pages/login/form/login_form.dart';

class LoginPage extends StatefulWidget {
  final ThemeController themeController;

  const LoginPage({super.key, required this.themeController});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showHint();
    });

    widget.themeController.themeNotifier.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    widget.themeController.themeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    if (context.mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      _showHint();
    }
  }

  _showHint() {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 10),
          content: Text(
            'Email: teste@email.com | Senha: 123456',
            style:
                widget
                    .themeController
                    .themeNotifier
                    .value
                    .textTheme
                    .bodyMedium!,
          ),
          backgroundColor:
              widget
                  .themeController
                  .themeNotifier
                  .value
                  .scaffoldBackgroundColor,
        ),
      );
    }
  }

  toggleLoading() {
    setState(() => isLoading = !isLoading);
  }

  // Simulação falha de login
  handleLoginFailed(BuildContext context, String? errorMessage) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage ?? 'Ocorreu um erro. Verifique os dados!'),
          backgroundColor: ColorsConst.errorColor,
        ),
      );
    }
    return;
  }

  verifyLogin(
    BuildContext context,
    GlobalKey<FormState> formKey,
    UserModel payload,
  ) async {
    toggleLoading();
    String? errorMessage;
    if (formKey.currentState!.validate()) {
      final user = await UserDao.getUserByEmail(payload.email);

      if (payload.password != user?.password || user == null) {
        toggleLoading();
        handleLoginFailed(context, 'Credenciais inválidas');
        return;
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushReplacementNamed(context, '/home');
      }
      return;
    }
    toggleLoading();
    handleLoginFailed(context, errorMessage);
    return;
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
          decoration: const BoxDecoration(
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
                  verifyLogin: verifyLogin,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SwitchThemeButton(controller: widget.themeController),
                ),
              ),

              if (isLoading) const LoadingSpinner(),
            ],
          ),
        ),
      ),
    );
  }
}
