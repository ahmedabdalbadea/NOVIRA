import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/core/widgets/custom_text_field.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:novira_app/generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key, required this.mood});
  final String mood;
  @override
  Widget build(BuildContext context) {
    return OnboardingCardBody(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomLogo(),
          const SizedBox(height: 8),
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              S.of(context).createYourSafeSpace,
              style: Styles.textStyle24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Full Name",
            style: Styles.textStyle14.copyWith(color: kDesTextColor),
          ),
          const SizedBox(height: 8),
          CustomTextField(hintText: S.of(context).enterFullName),
        ],
      ),
    );
  }
}
