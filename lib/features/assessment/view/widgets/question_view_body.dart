import 'package:flutter/material.dart';
import 'package:novira_app/features/assessment/view/widgets/linear_percent_indicator_section.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionViewBody extends StatelessWidget {
  const QuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [LinearPercentIndicatorSection()]);
  }
}
