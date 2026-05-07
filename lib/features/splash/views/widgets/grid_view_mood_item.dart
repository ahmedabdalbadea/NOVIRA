import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/models/mood_model.dart';
import 'package:novira_app/core/utils/functions/get_translated_mood.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/mood_item_content.dart';

class GridViewMoodItem extends StatelessWidget {
  const GridViewMoodItem({
    super.key,
    required this.mood,
    required this.isSelected,
  });
  final MoodModel mood;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.1 : 1,
      duration: const Duration(milliseconds: 200),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [BoxShadow(color: const Color(0x9240C3FF), blurRadius: 10)]
              : null,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Card(
          color: Colors.white,
          shadowColor: Colors.black.withValues(alpha: 0.04),
          child: MoodItemContent(mood: mood),
        ),
      ),
    );
  }
}
