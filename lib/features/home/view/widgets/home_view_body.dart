import 'package:flutter/material.dart';
import 'package:novira_app/features/home/view/widgets/selector_mood_list.dart';
import 'package:novira_app/features/home/view/widgets/user_greeting.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, this.moodIndex});
  final int? moodIndex;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: UserGreeting()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: OnboardingCardBody(
                body: SelectorMoodList(moodIndex: moodIndex),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
