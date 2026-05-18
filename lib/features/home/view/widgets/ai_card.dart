import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/home/view/widgets/ai_icon.dart';

class AiCard extends StatelessWidget {
  const AiCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: kEndSecGradientColor.withValues(alpha: 0.08),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 36),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AiIcon(),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Talk to NOVIRA AI", style: Styles.textStyle18),
              const SizedBox(height: 8),
              Text(
                "I'm here to listen.",
                style: Styles.textStyle14.copyWith(color: kDesTextColor),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: MediaQuery.widthOf(context) * 0.3,
                child: CustomElevatedButton(
                  gradientColors: [
                    kStartSecGradientColor,
                    kEndSecGradientColor,
                  ],
                  title: "Start Chat",
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kAiChatView);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
