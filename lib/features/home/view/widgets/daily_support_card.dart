import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';

class DailySupportCard extends StatelessWidget {
  const DailySupportCard({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return OnboardingCardBody(
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Daily Support", style: Styles.textStyle18),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Text(
              "\"Small steps still move you forward.\"",
              textAlign: TextAlign.center,
              style: Styles.textStyle16,
            ),
          ),
          const SizedBox(height: 16),
          CustomElevatedButton(
            gradientColors: [kStartThiGradientColor, kEndThiGradientColor],
            title: "Start Today's Exercise",
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
