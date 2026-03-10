import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/assets_data.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.5 / 1,
      child: Image.asset(AssetsData.kLogo),
    );
  }
}
