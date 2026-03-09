import 'package:flutter/material.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key, required this.mood});
  final String mood;
  @override
  Widget build(BuildContext context) {
    return OnboardingCardBody(body: Text(mood));
  }
}
