import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/features/assessment/data/models/question_model/standard_answer.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/choice_and_not_choice_answer_card.dart';

class AnswersSection extends StatelessWidget {
  const AnswersSection({
    super.key,
    required this.answers,
    required this.questionIndex,
  });
  final List<StandardAnswer> answers;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    final QuestionCubit questionCubit = context.read<QuestionCubit>();
    return BlocBuilder<QuestionCubit, QuestionState>(
      buildWhen: (previous, current) => current is QuestionUpdate,
      builder: (context, state) {
        return Column(
          children: answers
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    if (!questionCubit.isSelected(questionIndex)) {
                      questionCubit.increaseCompletedAnswers();
                    }
                    questionCubit.updateAnswerValue(
                      questionIndex: questionIndex,
                      answersValue: e.value,
                    );
                  },
                  child: AnswerCard(
                    title: e.text,
                    value: e.value,
                    isChoicen:
                        e.value ==
                        questionCubit
                            .questionModel!
                            .questions[questionIndex]
                            .selectedValue,
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
