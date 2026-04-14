import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const IconLanguageButton(),
                const SizedBox(height: 6),
                const OnboardingCard(),
              ],
            ),
          ),
        );
      },
    );
  }
}
