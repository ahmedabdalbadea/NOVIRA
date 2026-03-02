import 'package:flutter/material.dart';
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
          child: LanguageMenuButton(),
        ),
      ),
    );
  }

  ThemeData changeSelectedColor(BuildContext context) {
    return Theme.of(context).copyWith(
      // The background color of the currently selected item
      highlightColor: const Color(0xFFE0F2F1),
      // The faint color seen when hovering over an item
      hoverColor: const Color(0xFFE0F2F1).withValues(alpha: 0.5),
    );
  }

  BoxDecoration getDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
    );
  }
}
