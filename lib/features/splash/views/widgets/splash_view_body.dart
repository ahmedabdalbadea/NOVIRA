import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        // Icon button that drops down the language selection menu
        IconLanguageButton(),
      ],
    );
  }
}
