import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/assessment/view/widgets/result_view_body.dart';

class ResultView extends StatelessWidget {
  final int totalScore;
  final int maxScore;
  final int totalQuestions;
  final String assessmentType;

  const ResultView({
    super.key,
    required this.totalScore,
    required this.maxScore,
    required this.totalQuestions,
    required this.assessmentType,
  });

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(
        child: ResultViewBody(
          totalScore: totalScore,
          maxScore: maxScore,
          totalQuestions: totalQuestions,
          assessmentType: assessmentType,
        ),
      ),
    );
  }
}
