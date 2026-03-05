import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconLanguageButton(),
        const SizedBox(height: 6),
        OnboardingCard(),
      ],
    );
  }
}
