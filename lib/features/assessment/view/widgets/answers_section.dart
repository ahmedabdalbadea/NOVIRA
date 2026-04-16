import 'package:flutter/material.dart';
import 'package:novira_app/features/assessment/data/models/question_model/answer.dart';
import 'package:novira_app/features/assessment/view/widgets/choice_and_not_choice_answer_card.dart';

class AnswersSection extends StatefulWidget {
  const AnswersSection({super.key, required this.answers});

  final List<Answer> answers;

  @override
  State<AnswersSection> createState() => _AnswersSectionState();
}

class _AnswersSectionState extends State<AnswersSection> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: selectedAnswer,
      onChanged: (value) {
        setState(() {
          selectedAnswer = value;
        });
      },
      child: Column(
        children: widget.answers
            .map(
              (e) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAnswer = e.score;
                  });
                },
                child: AnswerCard(
                  title: e.answer!,
                  value: e.score!,
                  isChoicen: e.isSelected!,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
