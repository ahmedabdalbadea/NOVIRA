import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/features/auth/views/widgets/navigate_to_section.dart';
import 'package:novira_app/features/auth/views/widgets/user_inputs_section.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:novira_app/generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key, required this.mood});
  final String mood;
  @override
  Widget build(BuildContext context) {
    return OnboardingCardBody(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomLogo(),
          const SizedBox(height: 8),
          Text(S.of(context).createYourSafeSpace, style: Styles.textStyle24),
          const SizedBox(height: 24),
          UserInputsSection(),
          const SizedBox(height: 24),
          NavigateToSection(mood: mood),
        ],
      ),
    );
  }
}
