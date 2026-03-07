import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/generated/l10n.dart';

class OnboardingCardActions extends StatelessWidget {
  const OnboardingCardActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.66,
          child: Text(
            S.of(context).onboardingDescription,
            style: Styles.textStyle14.copyWith(color: kDesTextColor),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 28),

        CustomElevatedButton(
          title: S.of(context).startYourJourney,
          gradientColors: kSecGradientColors,
          onPressed: () {},
        ),

        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).alreadyHaveAccount,
            style: Styles.textStyle14.copyWith(color: kDesTextColor),
          ),
        ),
      ],
    );
  }
}
