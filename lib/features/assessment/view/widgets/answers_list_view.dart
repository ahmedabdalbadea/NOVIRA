import 'package:flutter/material.dart';
import 'package:novira_app/features/assessment/view/widgets/choice_and_not_choice_answer_card.dart';

class AnswersListView extends StatefulWidget {
  const AnswersListView({super.key, required this.answers});

  final List<String> answers;

  @override
  State<AnswersListView> createState() => _AnswersListViewState();
}

class _AnswersListViewState extends State<AnswersListView> {
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
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.answers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedAnswer = index;
              });
            },
            child: AnswerCard(
              title: widget.answers[index],
              value: index,
              isChoicen: index == selectedAnswer,
            ),
          );
        },
      ),
    );
  }
}
