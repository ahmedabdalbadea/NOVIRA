import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/linear_percent_indicator_section.dart';
import 'package:novira_app/features/assessment/view/widgets/question_actions.dart';
import 'package:novira_app/features/assessment/view/widgets/question_details.dart';

class QuestionViewBody extends StatelessWidget {
  const QuestionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        if (state is QuestionSuccess || state is QuestionUpdate) {
          return Center(
            child: Column(
              children: const [
                Expanded(child: SizedBox()),
                // Progress user in Questions
                LinearPercentIndicatorSection(),
                SizedBox(height: 22),
                // Questin with des and answers
                QuestionDetails(),
                SizedBox(height: 18),
                // To move from question to other
                QuestionActions(),
                Expanded(child: SizedBox()),
              ],
            ),
          );
        } else if (state is QuestionFailure) {
          return Center(child: Text(state.errMsg));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
