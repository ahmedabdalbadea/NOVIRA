import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button_menu.dart';

class IconLanguageButton extends StatelessWidget {
  const IconLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Container(
          decoration: _buildDecoration(),
          child: Theme(
            data: _changeSelectedColor(context),
            child: const IconLanguageButtonMenu(),
          ),
        ),
      ),
    );
  }

  ThemeData _changeSelectedColor(BuildContext context) {
    return Theme.of(context).copyWith(
      highlightColor: const Color(0xffe9f5f5),
      cardColor: kPrimaryColor,
      hoverColor: const Color(0xffe8f5fa),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(50),
      boxShadow: _shadows,
    );
  }

  List<BoxShadow> get _shadows {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.05),
        blurRadius: 10,
        spreadRadius: 1,
      ),
    ];
  }
}
