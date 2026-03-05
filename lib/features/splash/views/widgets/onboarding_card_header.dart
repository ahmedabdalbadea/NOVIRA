import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/core/utils/styles.dart';

class OnboardingCardHeader extends StatelessWidget {
  const OnboardingCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(aspectRatio: 4.5 / 1, child: Image.asset(AssetsData.kLogo)),

        const SizedBox(height: 12),

        Text(
          "New Journey, Inner Harmony",
          style: Styles.textStyle14.copyWith(color: kDesTextColor),
        ),
      ],
    );
  }
}
