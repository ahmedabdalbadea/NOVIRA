import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/features/splash/views/widgets/language_menu_button.dart';

class IconLanguageButton extends StatelessWidget {
  const IconLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: getDecoration(),
          // Theme widget
          // is used here to locally override the PopupMenu's behavior
          child: Theme(
            data: changeSelectedColor(context),
            child: const LanguageMenuButton(),
          ),
        ),
      ),
    );
  }

  /// Customizes the look of the popup menu items when interacted with
  ThemeData changeSelectedColor(BuildContext context) {
    return Theme.of(context).copyWith(
      // Changes the background color of the currently active/selected menu item
      highlightColor: const Color(0xffe8f5fa),
      // Changes the splash/overlay color when a user hovers or taps an item
      hoverColor: kPrimaryColor,
    );
  }

  /// Defines the circular background style for the language icon
  BoxDecoration getDecoration() {
    return BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(50),
    );
  }
}
