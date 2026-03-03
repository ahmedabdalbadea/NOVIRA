import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/features/splash/views/widgets/language_menu_button.dart';

class IconLanguageButton extends StatelessWidget {
  const IconLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerRight,
      child: Container(
        decoration: getDecoration(),
        child: Theme(
          data: changeSelectedColor(context),
          child: const LanguageMenuButton(),
        ),
      ),
    );
  }

  ThemeData changeSelectedColor(BuildContext context) {
    return Theme.of(context).copyWith(
      // The background color of the currently selected item
      highlightColor: const Color(0xffe8f5fa),
      // The faint color seen when hovering over an item
      hoverColor: kPrimaryColor,
    );
  }

  BoxDecoration getDecoration() {
    return BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(50),
    );
  }
}
