import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/splash/views/widgets/icon_language_button.dart';
import 'package:novira_app/features/splash/views/widgets/mood_selector_grid_view.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- Top Bar Section ---
        // Language selection dropdown button
        IconLanguageButton(),
        const SizedBox(height: 6),

        // --- Main Content Card ---
        Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width * 0.90,
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(
                  0xFFE0E0E0,
                ).withValues(alpha: 0.5), // Light grey shadow
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              // Logo image with fixed aspect ratio to prevent distortion
              AspectRatio(
                aspectRatio: 4.5 / 1,
                child: Image.asset(AssetsData.kLogo),
              ),

              const SizedBox(height: 12),

              // App Tagline
              Text(
                "New Journey, Inner Harmony",
                style: Styles.textStyle14.copyWith(color: kDesTextColor),
              ),

              const SizedBox(height: 28),

              // --- User Engagement Section ---
              // Primary headline question
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: const Text(
                  "How are you feeling today?",
                  style: Styles.textStyle24,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),

              const SizedBox(height: 28),
              // Select mood
              MoodSelectorGridView(),
              const SizedBox(height: 12),

              // Motivational/Description subtext
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.66,
                child: Text(
                  "Let's begin your journey toward better\n well-being. We'll personalize your\n experience.",
                  style: Styles.textStyle14.copyWith(color: kDesTextColor),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 28),

              // --- Action Section ---
              // Main CTA (Call to Action) button with gradient styling
              CustomElevatedButton(
                title: "Start Your Journey",
                gradient: kButtonGradient,
                onPressed: () {},
              ),

              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "I already have an account",
                  style: Styles.textStyle14.copyWith(color: kDesTextColor),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
