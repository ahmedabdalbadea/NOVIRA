import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/features/assessment/data/models/question_model/standard_answer.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:novira_app/features/assessment/view/widgets/choice_and_not_choice_answer_card.dart';

class AnswersSection extends StatefulWidget {
  const AnswersSection({
    super.key,
    required this.answers,
    required this.questionIndex,
  });
  final List<StandardAnswer> answers;
  final int questionIndex;

  @override
  State<AnswersSection> createState() => _AnswersSectionState();
}

class _AnswersSectionState extends State<AnswersSection> {
  @override
  Widget build(BuildContext context) {
    final QuestionCubit questionCubit = context.read<QuestionCubit>();
    return Column(
      children: widget.answers
          .map(
            (e) => GestureDetector(
              onTap: () {
                setState(() {
                  if (!questionCubit.isSelected(widget.questionIndex)) {
                    questionCubit.increaseCompletedAnswers();
                  }
                  questionCubit.updateAnswerValue(
                    questionIndex: widget.questionIndex,
                    answersValue: e.value,
                  );
                });
              },
              child: AnswerCard(
                title: e.text,
                value: e.value,
                isChoicen:
                    e.value ==
                    questionCubit
                        .questionModel!
                        .questions[widget.questionIndex]
                        .selectedValue,
              ),
            ),
          )
          .toList(),
    );
  }
}
