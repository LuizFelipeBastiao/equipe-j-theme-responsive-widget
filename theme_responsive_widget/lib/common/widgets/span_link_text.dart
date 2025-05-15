import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class SpanLinkText extends StatelessWidget {
  final String textSpan;
  final String textLink;
  final Function onTap;

  const SpanLinkText({
    super.key,
    required this.textSpan,
    required this.textLink,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        style: theme.textTheme.bodySmall,
        children: [
          TextSpan(text: textSpan),
          TextSpan(
            text: textLink,
            style: TextStyle(
              fontFamily: theme.textTheme.bodySmall!.fontFamily,
              fontSize: theme.textTheme.bodySmall!.fontSize,
              fontWeight: theme.textTheme.bodySmall!.fontWeight,
              color: ColorsConst.primaryColor,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => onTap(),
          ),
        ],
      ),
    );
  }
}
