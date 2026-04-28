import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/functions/show_snack_bar_error.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/circle_elevated_button.dart';

class QuestionActions extends StatelessWidget {
  const QuestionActions({super.key});

  @override
  Widget build(BuildContext context) {
    final QuestionCubit questionCubit = context.read<QuestionCubit>();

    return BlocBuilder<QuestionCubit, QuestionState>(
      buildWhen: (previous, current) => current is QuestionUpdate,
      builder: (context, state) {
        final bool isLastQuestion =
            questionCubit.currentQuestion ==
            questionCubit.questionModel!.metadata.totalQuestions - 1;

        return SizedBox(
          width: MediaQuery.widthOf(context) * 0.9,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleElevatedButton(
                    child: const Icon(Icons.arrow_back),
                    onPressed: () {
                      questionCubit.previousQuestion();
                    },
                  ),
                ),
                const SizedBox(width: 25),
                Expanded(
                  flex: 5,
                  child: CustomElevatedButton(
                    gradientColors: isLastQuestion
                        ? [kStartThiGradientColor, kEndThiGradientColor]
                        : [kStartSecGradientColor, kEndSecGradientColor],
                    title: isLastQuestion ? 'Complete' : 'Next',
                    onPressed: () {
                      if (isLastQuestion) {
                        completeAssessment(questionCubit, context);
                      } else {
                        validateQuestions(questionCubit, context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void completeAssessment(QuestionCubit questionCubit, BuildContext context) {
    if (questionCubit.countCompletedAnswers ==
        questionCubit.questionModel!.metadata.totalQuestions) {
      context.go(
        AppRouter.kResultView,
        extra: questionCubit.calculateResults(),
      );
    } else {
      showSnackBarError(context, 'Please answer all questions to complete!');
    }
  }

  void validateQuestions(QuestionCubit questionCubit, BuildContext context) {
    if (questionCubit.countCompletedAnswers ==
        questionCubit.questionModel!.metadata.totalQuestions) {
    } else {
      checkProgress(questionCubit, context);
    }
  }

  void checkProgress(QuestionCubit questionCubit, BuildContext context) {
    if (questionCubit.currentQuestion ==
        questionCubit.questionModel!.metadata.totalQuestions - 1) {
      showSnackBarError(context, 'Please complete questions!');
    } else {
      questionCubit.nextQuestion();
    }
  }
}
