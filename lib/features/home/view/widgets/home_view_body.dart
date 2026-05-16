import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/core/providers/mood_provider/mood_provider.dart';
import 'package:provider/provider.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/features/home/data/models/weekly_assessment_model.dart';
import 'package:novira_app/features/home/view/widgets/ai_card.dart';
import 'package:novira_app/features/home/view/widgets/daily_support_card.dart';
import 'package:novira_app/features/home/view/widgets/weekly_progress_chart.dart';
import 'package:novira_app/features/home/view/widgets/selector_mood_list.dart';
import 'package:novira_app/features/home/view/widgets/user_greeting.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static final mockData = [
    WeeklyAssessment(date: DateTime(2025, 1, 1), totalScore: 27 - 18),
    WeeklyAssessment(date: DateTime(2025, 1, 8), totalScore: 27 - 14),
    WeeklyAssessment(date: DateTime(2025, 1, 15), totalScore: 27 - 10),
    WeeklyAssessment(date: DateTime(2025, 1, 22), totalScore: 27 - 8),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: CustomScrollView(
        scrollBehavior: ScrollBehavior().copyWith(
          overscroll: false,
          physics: const BouncingScrollPhysics(),
        ),
        slivers: [
          const SliverToBoxAdapter(child: UserGreeting()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: OnboardingCardBody(
                body: SelectorMoodList(
                  moodIndex: Provider.of<MoodProvider>(
                    context,
                  ).selectedItemIndex,
                ),
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
              ),
            ),
          ),
          SliverToBoxAdapter(child: WeeklyProgressChart(weeklyData: mockData)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: DailySupportCard(
                onPressed: () {
                  context.go(AppRouter.kAssessmentView);
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: AiCard()),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),
        ],
      ),
    );
  }
}
