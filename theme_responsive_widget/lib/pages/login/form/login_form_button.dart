import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class LoginFormButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(BuildContext context) handleLoginFailed;
  final Function toggleLoading;

  const LoginFormButton({
    super.key,
    required this.formKey,
    required this.handleLoginFailed,
    required this.toggleLoading,
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
        toggleLoading();
        Future.delayed(const Duration(milliseconds: 2000)).then((_) {
          if (context.mounted) {
            toggleLoading();
            if (formKey.currentState!.validate()) {
              print('Login successful');
            } else {
              handleLoginFailed(context);
            }
          }
        });
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
