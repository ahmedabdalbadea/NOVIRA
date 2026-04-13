import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/assessment/data/models/question_model.dart';
import 'package:novira_app/features/assessment/view/widgets/answers_list_view.dart';
import 'package:novira_app/features/assessment/view/widgets/linear_percent_indicator_section.dart';
import 'package:novira_app/features/assessment/view/widgets/question_details.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

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
          const SizedBox(height: 34),
          const LinearPercentIndicatorSection(),
          const SizedBox(height: 22),
          QuestionDetails(),
        ],
      ),
    );
  }
}
