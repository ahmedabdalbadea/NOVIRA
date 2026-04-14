import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/assessment/view/widgets/assessment_preview_panel.dart';

class AssessmentIntroCard extends StatelessWidget {
  const AssessmentIntroCard({super.key, required this.onStartPressed});

  final VoidCallback onStartPressed;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double cardWidth = screenWidth < 560 ? screenWidth : 560;
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.68),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.72)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7A8A96).withValues(alpha: 0.20),
            blurRadius: 28,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Let's Understand How You've Been Feeling",
            textAlign: TextAlign.center,
            style: Styles.textStyle30.copyWith(
              fontSize: 25,
              height: 1.24,
              color: const Color(0xFF33404A),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'This short check-in helps us personalize your support. It takes less than 2 minutes.',
            textAlign: TextAlign.center,
            style: Styles.textStyle14.copyWith(
              fontSize: 14,
              color: kDesTextColor,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withValues(alpha: 0.72),
                  Colors.white.withValues(alpha: 0.46),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: const AssessmentPreviewPanel(),
          ),
          const SizedBox(height: 26),
          CustomElevatedButton(
            gradientColors: [kStartSecGradientColor, kEndSecGradientColor],
            title: 'Start Assessment',
            onPressed: onStartPressed,
          ),
          const SizedBox(height: 14),
          Text(
            'You can skip for now',
            style: Styles.textStyle14.copyWith(
              color: kDesTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
