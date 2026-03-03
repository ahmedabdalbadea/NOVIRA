import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon button that drops down the language selection menu
        IconLanguageButton(),

        Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width * 0.90,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 4.5 / 1,
                child: Image.asset(AssetsData.kLogo),
              ),
              const SizedBox(height: 12),
              const Text(
                "New Journey, Inner Harmony",
                style: Styles.textStyle14,
              ),

              const SizedBox(height: 28),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: const Text(
                  "How are you feeling today?",
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),

              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.66,
                child: Text(
                  "Let's begin your journey toward better\n well-being. We'll personalize your\n experience.",
                  style: Styles.textStyle14,
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
