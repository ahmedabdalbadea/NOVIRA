import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/assessment/manager/provider/question_provider.dart';
import 'package:novira_app/features/assessment/view/widgets/circle_elevated_button.dart';
import 'package:provider/provider.dart';

class QuestionActions extends StatelessWidget {
  const QuestionActions({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionProvider questionProvider = Provider.of<QuestionProvider>(
      context,
      listen: false,
    );
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CircleElevatedButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              questionProvider.perviousQuestion();
            },
          ),
        ),
        Expanded(
          flex: 5,
          child: CustomElevatedButton(
            gradientColors: [kStartSecGradientColor, kEndSecGradientColor],
            title: "Next",
            onPressed: () {
              questionProvider.nextQuestion();
            },
          ),
        ),
      ],
    );
  }
}
