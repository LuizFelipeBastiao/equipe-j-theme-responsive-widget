import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class FormInput extends StatelessWidget {
  final ThemeData? theme;
  final String labelText;
  final String? hintText;
  final bool? isObscure;
  final double? inputWidth;
  final double? inputHeight;
  final String? Function(String?)? validate;

  const FormInput({
    super.key,
    this.theme,
    required this.labelText,
    this.hintText,
    this.isObscure,
    this.inputWidth,
    this.inputHeight,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: inputWidth ?? MediaQuery.of(context).size.width,
      child: TextFormField(
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorsConst.errorInputBorderColor,
              width: 2,
            ),
          ),
          floatingLabelStyle: const TextStyle(fontSize: 18),
          labelText: labelText,
          labelStyle:
              theme?.textTheme.labelMedium ??
              const TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
          hintText: hintText,
          hintStyle:
              theme?.inputDecorationTheme.hintStyle ??
              const TextStyle(fontSize: 14, color: Color(0xFFFFFFFF)),
          filled: true,
          fillColor: theme?.inputDecorationTheme.fillColor ?? Colors.white,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorsConst.primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
