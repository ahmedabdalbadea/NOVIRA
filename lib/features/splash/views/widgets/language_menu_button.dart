import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class LanguageMenuButton extends StatelessWidget {
  const LanguageMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 4,
      shadowColor: Colors.black12,
      clipBehavior: Clip.antiAlias,
      menuPadding: EdgeInsets.zero,
      // Positions the menu (x, y) relative to the icon
      offset: const Offset(0, 55),
      initialValue: "en",
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      icon: Icon(Icons.language, color: Colors.grey),
      itemBuilder: languages,
    );
  }

  List<PopupMenuEntry<String>> languages(BuildContext context) => [
    PopupMenuItem(
      value: "en",
      child: Text("English", style: Styles.textStyle12),
    ),

    PopupMenuItem(
      value: 'ar',
      child: Text(
        "العربية",
        style: Styles.textStyle12.copyWith(
          color: Colors.black.withValues(alpha: 0.7),
        ),
        textDirection: TextDirection.rtl,
      ),
    ),
  ];
}
