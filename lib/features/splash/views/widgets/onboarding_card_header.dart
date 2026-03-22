import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/generated/l10n.dart';

class OnboardingCardHeader extends StatelessWidget {
  const OnboardingCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomLogo(),

        const SizedBox(height: 12),

        Text(
          S.of(context).appTagline,
          style: Styles.textStyle14.copyWith(color: kDesTextColor),
        ),
      ],
    );
  }
}
