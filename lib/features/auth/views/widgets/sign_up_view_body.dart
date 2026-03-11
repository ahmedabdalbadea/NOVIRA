import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/features/auth/views/widgets/navigate_to_log_in_section.dart';
import 'package:novira_app/features/auth/views/widgets/user_inputs_section.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:novira_app/generated/l10n.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key, required this.mood});
  final String mood;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: PageScrollPhysics(parent: BouncingScrollPhysics()),
        child: OnboardingCardBody(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomLogo(),
              const SizedBox(height: 8),
              Text(
                S.of(context).createYourSafeSpace,
                style: Styles.textStyle24,
              ),
              const SizedBox(height: 24),
              UserInputsSection(),
              const SizedBox(height: 24),
              NavigateToLogInSection(mood: mood),
            ],
          ),
        ),
      ),
    );
  }
}
