import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class TelaOnboarding2 extends StatefulWidget{
  const TelaOnboarding2({super.key});

  @override
  State<StatefulWidget> createState() => _TelaOnboarding2State();
  
}

class _TelaOnboarding2State extends State<TelaOnboarding2>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConst.primaryColor,
      child:  Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            
            const Text(
              'Este app possui configuração de tema claro/escuro',
              style: TextStyle(
                fontSize: 40,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 125),
            Lottie.asset(width: 150,'assets/animations/theme.json')
            
          ],
        ),
      ),
    );
  }
}