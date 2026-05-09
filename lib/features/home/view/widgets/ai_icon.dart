import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';

class AiIcon extends StatelessWidget {
  const AiIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5555),
        gradient: LinearGradient(
          colors: [kStartSecGradientColor, kEndSecGradientColor],
        ),
      ),
      child: Image.asset(AssetsData.kAiIcon),
    );
  }
}
