import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/features/splash/views/widgets/grid_view_mood_item.dart';

class MoodSelectorGridView extends StatelessWidget {
  const MoodSelectorGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.72,
      height: MediaQuery.heightOf(context) * 0.24,

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: kMoodsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => GridViewMoodItem(
          moodImage: AssetsData.kMoodsImagesList[index],
          mood: kMoodsList[index],
        ),
      ),
    );
  }
}
