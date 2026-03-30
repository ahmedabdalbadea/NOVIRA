import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class VerifyEmailViewBody extends StatelessWidget {
  const VerifyEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: OnboardingCardBody(
                body: Column(
                  children: [
                    const CustomLogo(),
                    const SizedBox(height: 24),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pink.withValues(alpha: 0.08),
                      ),
                      child: const Icon(
                        Icons.email_outlined,
                        size: 42,
                        color: Color(0xFF8B98D8),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text('Verify Your Email', style: Styles.textStyle30),
                    const SizedBox(height: 12),
                    Text(
                      "We've sent a verification link to your email address.",
                      textAlign: TextAlign.center,
                      style: Styles.textStyle14.copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please verify your email to continue.',
                      textAlign: TextAlign.center,
                      style: Styles.textStyle14.copyWith(color: kDesTextColor),
                    ),
                    const SizedBox(height: 28),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 22,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xFFEDEDED)),
                      ),
                      child: Text(
                        'Click the verification link in your email to activate your NOVIRA account and start your wellness journey.',
                        textAlign: TextAlign.center,
                        style: Styles.textStyle14.copyWith(
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomElevatedButton(
                      gradientColors: kSecGradientColors,
                      title: 'Open Email App',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend Email',
                        style: Styles.textStyle14.copyWith(color: kDesTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
