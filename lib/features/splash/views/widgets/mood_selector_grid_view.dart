import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/features/splash/views/widgets/grid_view_mood_item.dart';

class MoodSelectorGridView extends StatefulWidget {
  const MoodSelectorGridView({super.key});

  @override
  State<MoodSelectorGridView> createState() => _MoodSelectorGridViewState();
}

class _MoodSelectorGridViewState extends State<MoodSelectorGridView> {
  int itemSelected = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.72,

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: kMoodsList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              itemSelected = index;
            });
          },
          child: GridViewMoodItem(
            moodImage: AssetsData.kMoodsImagesList[index],
            mood: kMoodsList[index],
            isSelected: index == itemSelected,
          ),
        ),
      ),
    );
  }
}
