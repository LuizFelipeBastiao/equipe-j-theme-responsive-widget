import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';
import 'package:theme_responsive_widget/models/user_model.dart';

class LoginFormButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function(
    BuildContext context,
    GlobalKey<FormState> formKey,
    UserModel payload,
  )
  verifyLogin;

  const LoginFormButton({
    super.key,
    required this.formKey,
    required this.verifyLogin,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            theme.elevatedButtonTheme.style?.backgroundColor?.resolve({}) ??
            Colors.white,
        shape:
            theme.elevatedButtonTheme.style?.shape?.resolve({}) ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 70),
      ),
      onPressed: () {
        final payload = UserModel(
          email: emailController.text,
          password: passwordController.text,
        );
        
        verifyLogin(context, formKey, payload);
      },
      child: const Text(
        'Entrar',
        style: TextStyle(
          fontFamily: 'Poppins',
          color: ColorsConst.whiteTextColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
