import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/models/mood_model.dart';
import 'package:novira_app/core/utils/functions/get_translated_mood.dart';
import 'package:novira_app/core/utils/styles.dart';

class MoodItemContent extends StatelessWidget {
  const MoodItemContent({super.key, required this.mood});

  final MoodModel mood;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(mood.moodImage),
        Text(
          getTranslatedMood(context, mood.mood),
          style: Styles.textStyle12.copyWith(color: kDesTextColor),
        ),
      ],
    );
  }
}
