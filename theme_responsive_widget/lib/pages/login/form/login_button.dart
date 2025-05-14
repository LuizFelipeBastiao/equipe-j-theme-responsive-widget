import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final Function(BuildContext context) handleLoginFailed;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.handleLoginFailed,
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
        if (formKey.currentState!.validate()) {
          print('Login successful');
        } else {
          handleLoginFailed(context);
        }
      },
      child: Text(
        'Entrar',
        style: TextStyle(
          color: ColorsConst.whiteTextColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
