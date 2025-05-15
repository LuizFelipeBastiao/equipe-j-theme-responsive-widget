import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:theme_responsive_widget/common/colors/colors_const.dart';

class TelaOnboarding1 extends StatefulWidget{
  const TelaOnboarding1({super.key});

  @override
  State<StatefulWidget> createState() => _TelaOnboarding1State();
  
}

class _TelaOnboarding1State extends State<TelaOnboarding1>{

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsConst.primaryColor,
      child:  Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            
            const Text(
              'Bem vindo!',
              style: TextStyle(
                fontSize: 50,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 125),
            Lottie.asset('assets/animations/hand3.json')
            
          ],
        ),
      ),
    );
  }
}