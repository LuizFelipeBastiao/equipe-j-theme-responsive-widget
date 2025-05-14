import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorsConst.layer,
      ),
      child: Center(
        child: CircularProgressIndicator(
          color: ColorsConst.primaryColor,
          strokeWidth: 5,
        ),
      ),
    );
  }
}
