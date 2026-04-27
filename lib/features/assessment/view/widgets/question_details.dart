import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/answers_section.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class QuestionDetails extends StatelessWidget {
  const QuestionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final QuestionCubit questionCubit = context.read<QuestionCubit>();
    return OnboardingCardBody(
      body: BlocBuilder<QuestionCubit, QuestionState>(
        buildWhen: (previous, current) => current is QuestionUpdate,
        builder: (context, state) {
          QuestionModel questionModel = questionCubit.questionModel!;
          int currentQuestion = questionCubit.currentQuestion;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Description of Question
              Text(
                questionModel.questions[currentQuestion].desc,
                style: Styles.textStyle16.copyWith(color: kDesTextColor),
              ),
              const SizedBox(height: 16),
              //Question
              Text(
                questionModel.questions[currentQuestion].question,
                style: Styles.textStyle20,
              ),
              const SizedBox(height: 32),
              AnswersSection(
                answers: questionModel.standardAnswers,
                questionIndex: currentQuestion,
              ),
            ],
          );
        },
      ),
    );
  }
}
