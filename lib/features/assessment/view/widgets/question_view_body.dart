import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/question_loading_indicator.dart';
import 'package:novira_app/features/assessment/view/widgets/question_stepper_content.dart';

class QuestionViewBody extends StatelessWidget {
  const QuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        if (state is QuestionSuccess || state is QuestionUpdate) {
          return QuestionStepperContent();
        } else if (state is QuestionFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return QuestionLoadingIndicator();
        }
      },
    );
  }
}
