import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';
import 'package:theme_responsive_widget/pages/login/form/login_form_button.dart';
import 'package:theme_responsive_widget/pages/login/form/login_form_inputs.dart';
import 'package:theme_responsive_widget/common/widgets/span_link_text.dart';

class LoginForm extends StatefulWidget {
  final ThemeController themeController;
  final Function(BuildContext context) handleLoginFailed;
  final Function toggleLoading;

  const LoginForm({
    super.key,
    required this.themeController,
    required this.handleLoginFailed,
    required this.toggleLoading,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with TickerProviderStateMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AnimationController _containerController;
  late AnimationController _contentController;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _containerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _heightAnimation = Tween<double>(begin: 0.0, end: 0.7).animate(
      CurvedAnimation(parent: _containerController, curve: Curves.easeInOut),
    );

    _contentController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _containerController.forward().then((_) {
      _contentController.forward();
    });
  }

  @override
  void dispose() {
    _containerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = widget.themeController.themeNotifier.value;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _containerController,
      builder: (context, child) {
        return Container(
          height: height * _heightAnimation.value,
          width: width * 0.8,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 10,
                offset: const Offset(0, 15),
              ),
            ],
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              _heightAnimation.value > 0.5
                  ? FadeTransition(
                    opacity: _contentController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Login', style: theme.textTheme.titleMedium!),
                        Align(
                          child: LoginFormInputs(
                            formKey: formKey,
                            themeController: widget.themeController,
                          ),
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              LoginFormButton(
                                formKey: formKey,
                                handleLoginFailed: widget.handleLoginFailed,
                                toggleLoading: widget.toggleLoading,
                              ),
                              const SizedBox(height: 10),
                              SpanLinkText(
                                textSpan: 'Esqueceu a senha? ',
                                textLink: 'Recuperar',
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/forgot-password',
                                  );
                                },
                              ),
                              const SizedBox(height: 50),
                              SpanLinkText(
                                textSpan: 'Ainda não tem uma conta? ',
                                textLink: 'Registrar',
                                onTap: () {
                                  Navigator.pushNamed(context, '/register');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  : const SizedBox.shrink(),
        );
      },
    );
  }
}
