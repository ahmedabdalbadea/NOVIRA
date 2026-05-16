import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/home/view/widgets/bottom_app_bar_item.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final _items = const [
    (icon: Icons.home_outlined, label: 'Home'),
    (icon: Icons.group_outlined, label: 'Community'),
    (icon: Icons.trending_up, label: 'Tracking'),
    (icon: Icons.person_2_outlined, label: 'Profile'),
  ];

  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      margin: EdgeInsets.only(left: 18, right: 18, bottom: 22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_items.length, (index) {
          return GestureDetector(
            onTap: () {
              if (index != selectedItem) {
                setState(() {
                  selectedItem = index;
                });
              }
            },
            child: BottomAppBarItem(
              label: _items[index].label,
              icon: _items[index].icon,
              isActive: selectedItem == index,
            ),
          );
        }),
      ),
    );
  }
}

// _items.map((e) {
//           return BottomAppBarItem(
//             label: e.label,
//             icon: e.icon,
//             color: kDesTextColor,
//           );
//         }).toList()
