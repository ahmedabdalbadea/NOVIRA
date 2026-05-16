import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/question_loading_indicator.dart';
import 'package:novira_app/features/assessment/view/widgets/question_stepper_content.dart';

class QuestionViewBody extends StatelessWidget {
  const QuestionViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuestionCubit, QuestionState>(
      builder: (context, state) {
        if (state is QuestionSuccess || state is QuestionUpdate) {
          return QuestionStepperContent();
        } else if (state is QuestionFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return QuestionLoadingIndicator();
        }
      },
      listener: (BuildContext context, QuestionState state) {
        if (state is QuestionCompleted) {
          final cubit = context.read<QuestionCubit>();
          final maxScore = (cubit.questionModel?.questions.length ?? 1) * 3;
          final totalQuestions =
              cubit.questionModel?.metadata.totalQuestions ??
              (cubit.questionModel?.questions.length ?? 0);
          final assessmentType = cubit.questionModel?.metadata.type ?? '';

          context.go(
            AppRouter.kResultView,
            extra: {
              'totalScore': state.totalScore,
              'maxScore': maxScore,
              'totalQuestions': totalQuestions,
              'assessmentType': assessmentType,
            },
          );
        }
      },
    );
  }
}
