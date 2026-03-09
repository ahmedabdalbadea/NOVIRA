import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/functions/show_snack_bar_error.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/splash/manager/mood_provider/mood_provider.dart';
import 'package:novira_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class OnboardingCardActions extends StatelessWidget {
  const OnboardingCardActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.66,
          child: Text(
            S.of(context).onboardingDescription,
            style: Styles.textStyle14.copyWith(color: kDesTextColor),
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),

        const SizedBox(height: 28),

        CustomElevatedButton(
          title: S.of(context).startYourJourney,
          gradientColors: kSecGradientColors,
          onPressed: () {
            String? mood = Provider.of<MoodProvider>(
              context,
              listen: false,
            ).selectedMood;
            if (mood?.isEmpty ?? true) {
              showSnackBarError(context, S.of(context).pleaseSelectMood);
            } else {
              GoRouter.of(context).push(AppRouter.kSignUpView, extra: mood);
            }
          },
        ),

        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).alreadyHaveAccount,
            style: Styles.textStyle14.copyWith(color: kDesTextColor),
          ),
        ),
      ],
    );
  }
}
