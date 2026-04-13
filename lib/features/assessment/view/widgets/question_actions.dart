import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/assessment/view/widgets/circle_elevated_button.dart';

class QuestionActions extends StatelessWidget {
  const QuestionActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: CircleElevatedButton(child: Icon(Icons.arrow_back)),
        ),
        Expanded(
          flex: 5,
          child: CustomElevatedButton(
            gradientColors: [kStartSecGradientColor, kEndSecGradientColor],
            title: "Next",
          ),
        ),
      ],
    );
  }
}
