import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/features/splash/manager/mood_provider/mood_provider.dart';
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
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.90,
        padding: EdgeInsets.all(32),
        decoration: _buildDecoration(),
        child: Column(
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

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      boxShadow: _shadows,
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(24),
    );
  }

  List<BoxShadow> get _shadows {
    return [
      BoxShadow(
        color: Color(0xFFE0E0E0).withValues(alpha: 0.5),
        blurRadius: 20,
        offset: Offset(0, 8),
      ),
    ];
  }
}
