import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/assessment/view/widgets/assessment_view_body.dart';

class AssessmentView extends StatelessWidget {
  const AssessmentView({super.key, required this.moodMap});
  final Map<String, dynamic> moodMap;
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(child: AssessmentViewBody(moodMap: moodMap)),
    );
  }
}
