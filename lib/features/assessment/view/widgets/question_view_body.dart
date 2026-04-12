import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionViewBody extends StatelessWidget {
  const QuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        children: [
          // LinearPercentIndicator(
          //   width: 140.0,
          //   lineHeight: 14.0,
          //   percent: 0.5,
          //   backgroundColor: Colors.grey,
          //   progressColor: Colors.blue,
          // ),
        ],
      ),
    );
  }
}
