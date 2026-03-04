import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class GridViewMoodItem extends StatelessWidget {
  const GridViewMoodItem({
    super.key,
    required this.moodImage,
    required this.mood,
  });
  final String moodImage;
  final String mood;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.23,
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(18),
          ),
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
