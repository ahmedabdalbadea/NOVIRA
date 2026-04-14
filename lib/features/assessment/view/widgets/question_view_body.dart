import 'package:flutter/material.dart';
import 'package:novira_app/features/assessment/view/widgets/linear_percent_indicator_section.dart';
import 'package:novira_app/features/assessment/view/widgets/question_details.dart';

class QuestionViewBody extends StatefulWidget {
  const QuestionViewBody({super.key});

  @override
  State<QuestionViewBody> createState() => _QuestionViewBodyState();
}

class _QuestionViewBodyState extends State<QuestionViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Expanded(child: SizedBox()),
          const LinearPercentIndicatorSection(),
          const SizedBox(height: 22),
          const QuestionDetails(),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
