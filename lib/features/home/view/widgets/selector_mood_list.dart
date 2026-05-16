import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/features/home/view/widgets/mood_selector_list_item.dart';
import 'package:novira_app/features/home/view/widgets/nav_button_mood_selector.dart';

class SelectorMoodList extends StatefulWidget {
  const SelectorMoodList({super.key, required this.moodIndex});
  final int moodIndex;
  @override
  State<SelectorMoodList> createState() => _SelectorMoodListState();
}

class _SelectorMoodListState extends State<SelectorMoodList> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.moodIndex.clamp(0, AssetsData.kMoodsList.length - 3);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NavButtonMoodSelector(
          icon: Icons.chevron_left,
          isEnabled: _currentIndex > 0,
          onTap: () => setState(() => _currentIndex--),
        ),
        ...AssetsData.kMoodsList
            .skip(_currentIndex)
            .take(3)
            .map((e) => MoodSelectorListItem(mood: e)),
        NavButtonMoodSelector(
          icon: Icons.chevron_right,
          isEnabled: _currentIndex + 3 < AssetsData.kMoodsList.length,
          onTap: () => setState(() => _currentIndex++),
        ),
      ],
    );
  }
}
