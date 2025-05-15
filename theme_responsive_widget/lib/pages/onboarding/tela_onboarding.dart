import 'package:flutter/material.dart';
import 'tela_onboarding1.dart';
import 'package:onboarding/onboarding.dart';
import 'tela_onboarding2.dart';
import 'tela_onboarding3.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';


class TelaOnboarding extends StatefulWidget {
  final ThemeController themeController;

  const TelaOnboarding({super.key, required this.themeController});

  @override
  _TelaOnboardingState createState() => _TelaOnboardingState();
}

class _TelaOnboardingState extends State<TelaOnboarding> {
  int _paginaAtual = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          (Onboarding(
            swipeableBody: [
              const TelaOnboarding1(),
              const TelaOnboarding2(),
              TelaOnboarding3(themeController: widget.themeController),
              // Lista de widgets que podem ser arrastados horizontalmente
              // Cada widget representa uma tela de onboarding
              
            ],
            // a cada mudança da página, atualiza uma animação no topo
            onPageChanges:
                (netDragDistance, pagesLength, currentIndex, slideDirection) =>
                    {
                      setState(() {
                        _paginaAtual = currentIndex;
                      }),
                    },
          )),
          Column(
            children: [
              const SizedBox(height: 50),
              //mostra 3 pontos no topo da página que mudam de aparência dependendo de qual página
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _paginaAtual == index ? 24 : 16,
                    height: _paginaAtual == index ? 24 : 16,
                    decoration: BoxDecoration(
                      color: _paginaAtual == index ? Colors.black87 : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//muda a cor dos circulos baseado na página

