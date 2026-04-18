import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/answers_section.dart';
import 'package:novira_app/features/assessment/view/widgets/question_actions.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class QuestionDetails extends StatefulWidget {
  const QuestionDetails({super.key});

  @override
  State<QuestionDetails> createState() => _QuestionDetailsState();
}

class _QuestionDetailsState extends State<QuestionDetails> {
  int currentQuestion = 0;
  @override
  Widget build(BuildContext context) {
    final QuestionModel questionModel = BlocProvider.of<QuestionCubit>(
      context,
    ).questionModel!;
    return OnboardingCardBody(
      body: Column(
        children: [
          Text(
            questionModel.questions![currentQuestion].desc!,
            style: Styles.textStyle16.copyWith(color: kDesTextColor),
          ),
          const SizedBox(height: 16),
          Text(
            questionModel.questions![currentQuestion].question!,
            style: Styles.textStyle20,
          ),
          const SizedBox(height: 32),
          AnswersSection(answers: questionModel.standardAnswers!),
          const SizedBox(height: 18),
          QuestionActions(),
        ],
      ),
    );
  }
}
