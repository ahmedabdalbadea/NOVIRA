import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/features/auth/views/widgets/log_in_user_inputs_section.dart';
import 'package:novira_app/features/auth/views/widgets/navigate_to_sign_up_section.dart';
import 'package:novira_app/features/auth/views/widgets/social_auth_section.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class LogInViewBody extends StatelessWidget {
  const LogInViewBody({super.key, required this.mood});

  final String mood;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        child: OnboardingCardBody(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomLogo(),
              const SizedBox(height: 8),
              Text('Welcome Back', style: Styles.textStyle24),
              const SizedBox(height: 8),
              Text(
                "We're glad to see you again.",
                style: Styles.textStyle20,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const LogInUserInputsSection(),
              const SizedBox(height: 22),
              const SocialAuthSection(),
              const SizedBox(height: 24),
              NavigateToSignUpSection(mood: mood),
            ],
          ),
        ),
      ),
    );
  }
}
