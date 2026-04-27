import 'package:flutter/material.dart';
import 'package:novira_app/features/assessment/view/widgets/linear_percent_indicator_section.dart';
import 'package:novira_app/features/assessment/view/widgets/question_actions.dart';
import 'package:novira_app/features/assessment/view/widgets/question_details.dart';

class QuestionStepperContent extends StatelessWidget {
  const QuestionStepperContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Expanded(child: SizedBox()),
          // Progress user in Questions
          LinearPercentIndicatorSection(),
          SizedBox(height: 22),
          // Questin with des and answers
          QuestionDetails(),
          SizedBox(height: 18),
          // To move from question to other
          QuestionActions(),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
