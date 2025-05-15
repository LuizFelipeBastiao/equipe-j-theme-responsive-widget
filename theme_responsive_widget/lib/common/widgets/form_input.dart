import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class FormInput extends StatelessWidget {
  final ThemeData? theme;
  final String? labelText;
  final String? hintText;
  final bool? isObscure;
  final double? inputWidth;
  final double? inputHeight;
  final String? Function(String?)? validate;
  final TextEditingController inputController;

  const FormInput({
    super.key,
    this.theme,
    this.labelText,
    this.hintText,
    this.isObscure,
    this.inputWidth,
    this.inputHeight,
    this.validate,
    required this.inputController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inputWidth ?? MediaQuery.of(context).size.width,
      child: TextFormField(
        controller: inputController,
        validator: (value) => validate != null ? validate!(value) : null,
        obscureText: isObscure ?? false,
        style:
            theme?.textTheme.bodyMedium ??
            const TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
        decoration: InputDecoration(
          errorStyle: const TextStyle(
            fontSize: 12,
            color: ColorsConst.errorColor,
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: ColorsConst.errorInputBorderColor,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle:
              theme?.inputDecorationTheme.hintStyle ??
              const TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
          filled: true,
          fillColor: theme?.inputDecorationTheme.fillColor ?? Colors.white,
          contentPadding: const EdgeInsets.all(15),
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsConst.primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
