import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/manager/mood_provider/mood_provider.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_actions.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_header.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_mood_check_in.dart';
import 'package:provider/provider.dart';

class OnboardingCard extends StatelessWidget {
  const OnboardingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoodProvider(),
      child: OnboardingCardBody(
        body: Column(
          children: [
            OnboardingCardHeader(),
            const SizedBox(height: 28),
            OnboardingCardMoodCheckIn(),
            const SizedBox(height: 12),
            OnboardingCardActions(),
          ],
        ),
      ),
    );
  }
}
