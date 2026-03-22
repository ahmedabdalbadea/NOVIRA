import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/features/splash/manager/mood_provider/mood_provider.dart';
import 'package:novira_app/features/splash/views/widgets/grid_view_mood_item.dart';
import 'package:novira_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class MoodSelectorGridView extends StatefulWidget {
  const MoodSelectorGridView({super.key});

  @override
  State<MoodSelectorGridView> createState() => _MoodSelectorGridViewState();
}

class _MoodSelectorGridViewState extends State<MoodSelectorGridView> {
  int itemSelected = -1;

  @override
  Widget build(BuildContext context) {
    final MoodProvider moodProvider = Provider.of<MoodProvider>(context);
    return SizedBox(
      width: MediaQuery.widthOf(context) * 0.72,

      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: kMoodsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          String moodKey = kMoodsList[index];

          String translatedMood = _getTranslatedMood(context, moodKey);

          return GestureDetector(
            onTap: () {
              moodProvider.selectMood(index, translatedMood);
            },
            child: GridViewMoodItem(
              moodImage: AssetsData.kMoodsImagesList[index],
              mood: translatedMood,
              isSelected: index == moodProvider.selectedItemIndex,
            ),
          );
        },
      ),
    );
  }

  String _getTranslatedMood(BuildContext context, String moodKey) {
    switch (moodKey) {
      case "happyMood":
        return S.of(context).happyMood;
      case "calmMood":
        return S.of(context).calmMood;
      case "neutralMood":
        return S.of(context).neutralMood;
      case "sadMood":
        return S.of(context).sadMood;
      case "anxiousMood":
        return S.of(context).anxiousMood;
      case "overwhelmedMood":
        return S.of(context).overwhelmedMood;
      default:
        return moodKey;
    }
  }
}
