import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class GridViewMoodItem extends StatelessWidget {
  const GridViewMoodItem({
    super.key,
    required this.moodImage,
    required this.mood,
    required this.isSelected,
  });
  final String moodImage;
  final String mood;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(moodImage),
              Text(
                mood,
                style: Styles.textStyle12.copyWith(color: kDesTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
