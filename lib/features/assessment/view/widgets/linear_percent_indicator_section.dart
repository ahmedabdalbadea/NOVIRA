import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/assessment/data/models/question_model/question_model.dart';
import 'package:novira_app/features/assessment/manager/question_cubit/question_cubit.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearPercentIndicatorSection extends StatelessWidget {
  const LinearPercentIndicatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    int currentQuestion = BlocProvider.of<QuestionCubit>(
      context,
    ).currentQuestion;
    int questionsCount = BlocProvider.of<QuestionCubit>(
      context,
    ).questionModel!.questions.length;
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  "Question $currentQuestion of"
                  "$questionsCount",
                  style: Styles.textStyle12.copyWith(color: kDesTextColor),
                ),
                Spacer(),
                Text(
                  "${((currentQuestion / questionsCount) * 100).toInt()}"
                  "%",
                  style: Styles.textStyle12.copyWith(color: kDesTextColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          LinearPercentIndicator(
            lineHeight: 8.0,
            percent: 0.11,
            backgroundColor: kPrimaryColor,
            linearGradient: LinearGradient(
              colors: [kStartSecGradientColor, kEndSecGradientColor],
            ),
            barRadius: Radius.circular(50),
          ),
        ],
      ),
    );
  }
}
