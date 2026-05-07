import 'package:flutter/material.dart';
import 'package:novira_app/core/models/mood_model.dart';
import 'package:novira_app/core/widgets/mood_item_content.dart';

class MoodSelectorListItem extends StatelessWidget {
  const MoodSelectorListItem({super.key, required this.mood});
  final MoodModel mood;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      height: MediaQuery.widthOf(context) * 0.195,
      width: MediaQuery.widthOf(context) * 0.195,
      child: MoodItemContent(mood: mood),
    );
  }
}
