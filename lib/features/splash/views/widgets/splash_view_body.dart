import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> languageIconAnimation;
  late Animation<double> cardAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    languageIconAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.9, curve: Curves.easeOut),
      ),
    );

    cardAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeTransition(
          opacity: languageIconAnimation,
          child: const IconLanguageButton(),
        ),
        const SizedBox(height: 6),
        FadeTransition(
          opacity: cardAnimation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.2),
              end: Offset.zero,
            ).animate(cardAnimation),
            child: const OnboardingCard(),
          ),
        ),
      ],
    );
  }
}
