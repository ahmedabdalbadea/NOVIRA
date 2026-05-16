import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/core/utils/functions/get_translated_mood.dart';
import 'package:novira_app/core/providers/mood_provider/mood_provider.dart';
import 'package:novira_app/features/splash/views/widgets/grid_view_mood_item.dart';
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
        key: ValueKey(Localizations.localeOf(context).languageCode),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: AssetsData.kMoodsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 3,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              moodProvider.selectMood(
                index,
                getTranslatedMood(context, AssetsData.kMoodsList[index].mood),
              );
            },
            child: GridViewMoodItem(
              mood: AssetsData.kMoodsList[index],
              isSelected: index == moodProvider.selectedItemIndex,
            ),
          );
        },
      ),
    );
  }
}
