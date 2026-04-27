import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/assessment/view/widgets/choice_and_not_choice_answer_card.dart';
import 'package:novira_app/features/assessment/view/widgets/circle_elevated_button.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:skeletonizer/skeletonizer.dart';

class QuestionLoadingIndicator extends StatelessWidget {
  const QuestionLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      enableSwitchAnimation: true,
      child: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.9,
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              // Progress Section
              Column(
                children: [
                  const Row(
                    children: [
                      Text("Question 00 of 00"),
                      Spacer(),
                      Text("00%"),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),

              OnboardingCardBody(
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Assessing core interest levels"),
                    const SizedBox(height: 16),
                    const Text("Little interest or pleasure in doing things?"),
                    const SizedBox(height: 32),
                    ...List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: UnChoicenAnswer(
                          title: "Loading answer text...",
                          value: index,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  const Expanded(
                    flex: 1,
                    child: CircleElevatedButton(child: Icon(Icons.arrow_back)),
                  ),
                  const SizedBox(width: 25),
                  Expanded(
                    flex: 5,
                    child: CustomElevatedButton(
                      title: "Next",
                      gradientColors: const [Colors.grey, Colors.grey],
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
