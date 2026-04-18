import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinearPercentIndicatorSection extends StatelessWidget {
  const LinearPercentIndicatorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  "Question 1 of 10",
                  style: Styles.textStyle12.copyWith(color: kDesTextColor),
                ),
                Spacer(),
                Text(
                  "11%",
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
