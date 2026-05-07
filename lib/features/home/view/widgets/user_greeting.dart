import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class UserGreeting extends StatelessWidget {
  const UserGreeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Afternoon, Ahmed", style: Styles.textStyle24),
            const SizedBox(height: 4),
            Text(
              "How are you feeling right now?",
              style: Styles.textStyle14.copyWith(color: kDesTextColor),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [kStartSecGradientColor, kEndSecGradientColor],
            ),
            borderRadius: BorderRadius.circular(9999),
          ),
          child: Text(
            'A',
            style: Styles.textStyle20.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
