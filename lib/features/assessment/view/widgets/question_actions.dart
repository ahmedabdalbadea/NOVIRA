import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/functions/show_snack_bar_error.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/circle_elevated_button.dart';

class QuestionActions extends StatelessWidget {
  const QuestionActions({super.key});
  @override
  Widget build(BuildContext context) {
    final QuestionCubit questionCubit = context.read<QuestionCubit>();
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: [
            // button for go to pervious question
            Expanded(
              flex: 1,
              child: CircleElevatedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  questionCubit.previousQuestion();
                },
              ),
            ),
            const SizedBox(width: 25),
            // button for go to next question
            Expanded(
              flex: 5,
              child: CustomElevatedButton(
                gradientColors: [kStartSecGradientColor, kEndSecGradientColor],
                title: "Next",
                onPressed: () {
                  vaildateQuestions(questionCubit, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void vaildateQuestions(QuestionCubit questionCubit, BuildContext context) {
    if (questionCubit.countCompletedAnswers ==
        questionCubit.questionModel!.metadata.totalQuestions) {
      // navigate to next screen
    } else {
      checkProgress(
        questionCubit,
        context,
      ); // Are there any questions that he hasn't answered?
    }
  }

  void checkProgress(QuestionCubit questionCubit, BuildContext context) {
    if (questionCubit.currentQuestion ==
        questionCubit.questionModel!.metadata.totalQuestions - 1) {
      showSnackBarError(
        context,
        "Please Complete Questions!",
      ); // Warn him that there were missing questions.
    } else {
      questionCubit.nextQuestion(); // // go to next question
    }
  }
}
