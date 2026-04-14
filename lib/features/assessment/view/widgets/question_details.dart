import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/assessment/data/models/question_model.dart';
import 'package:novira_app/features/assessment/view/widgets/answers_list_view.dart';
import 'package:novira_app/features/assessment/view/widgets/question_actions.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class QuestionDetails extends StatefulWidget {
  const QuestionDetails({super.key});

  @override
  State<QuestionDetails> createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  final List<QuestionModel> questions = [
    QuestionModel(
      description: "Assessing core interest levels and daily engagement.",
      question:
          "Over the last 2 weeks, how often have you been bothered by little interest or pleasure in doing things?",
      answers: [
        "Not at all",
        "Several days",
        "More than half the days",
        "Nearly every day",
      ],
    ),
  ];

  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    return OnboardingCardBody(
      body: Column(
        children: [
          Text(
            questions[currentQuestion].description,
            style: Styles.textStyle16.copyWith(color: kDesTextColor),
          ),
          const SizedBox(height: 16),
          Text(questions[currentQuestion].question, style: Styles.textStyle20),
          const SizedBox(height: 32),
          AnswersListView(answers: questions[currentQuestion].answers),
          const SizedBox(height: 18),
          QuestionActions(),
        ],
      ),
    );
  }
}
