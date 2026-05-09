import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/home/view/data/models/weekly_assessment_model.dart';
import 'package:novira_app/features/home/view/widgets/daily_support_card.dart';
import 'package:novira_app/features/home/view/widgets/weekly_progress_chart.dart';
import 'package:novira_app/features/home/view/widgets/selector_mood_list.dart';
import 'package:novira_app/features/home/view/widgets/user_greeting.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, this.moodIndex});
  final int? moodIndex;
  static final mockData = [
    WeeklyAssessment(date: DateTime(2025, 1, 1), totalScore: 27 - 18),
    WeeklyAssessment(date: DateTime(2025, 1, 8), totalScore: 27 - 14),
    WeeklyAssessment(date: DateTime(2025, 1, 15), totalScore: 27 - 10),
    WeeklyAssessment(date: DateTime(2025, 1, 22), totalScore: 27 - 8),
  ];
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
          SliverToBoxAdapter(child: WeeklyProgressChart(weeklyData: mockData)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: DailySupportCard(),
            ),
          ),
        ],
      ),
    );
  }
}
