import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/splash/views/widgets/mood_selector_grid_view.dart';
import 'package:novira_app/generated/l10n.dart';

class OnboardingCardMoodCheckIn extends StatelessWidget {
  const OnboardingCardMoodCheckIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Text(
            S.of(context).howAreYouFeeling,
            style: Styles.textStyle24,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),

        const SizedBox(height: 28),
        const MoodSelectorGridView(),
      ],
    );
  }
}
