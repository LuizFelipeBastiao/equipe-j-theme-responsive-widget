import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/widgets/form_input.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';

class LoginFormInputs extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ThemeController themeController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormInputs({
    Key? key,
    required this.formKey,
    required this.themeController,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Form(
      key: formKey,
      child: Column(
        children: [
          FormInput(
            inputController: emailController,
            inputWidth: (width * 0.8) * 0.8,
            hintText: 'example@example.com',
            theme: themeController.themeNotifier.value,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              if (!RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
                return 'Email inválido';
              }
              return null;
            },
          ),
          SizedBox(height: (height * 0.6) * 0.02),
          FormInput(
            inputController: passwordController,
            inputWidth: (width * 0.8) * 0.8,
            hintText: '********',
            theme: themeController.themeNotifier.value,
            isObscure: true,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'Campo obrigatório';
              }
              if (value.length < 3) {
                return 'A senha deve ter pelo menos 3 caracteres';
              }
              if (value.length > 50) {
                return 'A senha deve ter no máximo 50 caracteres';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
