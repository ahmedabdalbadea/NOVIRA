import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/splash/manager/language_provider.dart/language_provider.dart';
import 'package:provider/provider.dart';

class IconLanguageButtonMenu extends StatelessWidget {
  const IconLanguageButtonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return PopupMenuButton(
      onSelected: (value) {
        languageProvider.language = value;
      },
      elevation: 4,
      shadowColor: Colors.black12,
      clipBehavior: Clip.antiAlias,
      menuPadding: EdgeInsets.zero,
      offset: const Offset(0, 55),
      initialValue: languageProvider.language,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      icon: Icon(Icons.language, color: Colors.grey),
      itemBuilder: _languages,
    );
  }

  List<PopupMenuEntry<String>> _languages(BuildContext context) => [
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
