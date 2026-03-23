import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/manager/mood_provider/mood_provider.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_actions.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_header.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_mood_check_in.dart';
import 'package:provider/provider.dart';

class OnboardingCard extends StatefulWidget {
  const OnboardingCard({super.key});

  @override
  State<OnboardingCard> createState() => _OnboardingCardState();
}

class _OnboardingCardState extends State<OnboardingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> headerAnimation;
  late Animation<double> moodGridAnimation;
  late Animation<double> actionsAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    headerAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.25, curve: Curves.easeOut),
    );

    moodGridAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 0.75, curve: Curves.easeOut),
    );

    actionsAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.75, 1.0, curve: Curves.easeOut),
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
    return ChangeNotifierProvider(
      create: (context) => MoodProvider(),
      child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: OnboardingCardBody(
            body: Column(
              children: [
                FadeTransition(
                  opacity: headerAnimation,
                  child: const OnboardingCardHeader(),
                ),
        
                const SizedBox(height: 28),
        
                FadeTransition(
                  opacity: moodGridAnimation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0.2),
                      end: Offset.zero,
                    ).animate(moodGridAnimation),
                    child: const OnboardingCardMoodCheckIn(),
                  ),
                ),
        
                const SizedBox(height: 12),
        
                FadeTransition(
                  opacity: actionsAnimation,
                  child: const OnboardingCardActions(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
