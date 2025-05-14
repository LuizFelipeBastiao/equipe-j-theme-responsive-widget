import 'package:flutter/material.dart';
import 'package:theme_responsive_widget/common/themes/theme_controller.dart';

class SwitchThemeButton extends StatefulWidget {
  final ThemeController controller;

  const SwitchThemeButton({super.key, required this.controller});

  @override
  State<SwitchThemeButton> createState() => _SwitchThemeButtonState();
}

class _SwitchThemeButtonState extends State<SwitchThemeButton> {
  late bool isDark;

  @override
  void initState() {
    super.initState();
    isDark =
        widget.controller.themeNotifier.value.brightness == Brightness.dark;
    widget.controller.themeNotifier.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    widget.controller.themeNotifier.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    final brightness = widget.controller.themeNotifier.value.brightness;
    setState(() => isDark = brightness == Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.controller.toggleTheme();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 30,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:
              isDark
                  ? const Color(0x832B2B2B)
                  : const Color.fromARGB(106, 255, 255, 255),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: isDark ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark ? Colors.black : Colors.white,
            ),
            child: Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              size: 16,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
