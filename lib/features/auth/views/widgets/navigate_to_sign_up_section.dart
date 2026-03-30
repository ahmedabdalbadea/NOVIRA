import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/generated/l10n.dart';

class NavigateToSignUpSection extends StatelessWidget {
  const NavigateToSignUpSection({super.key, required this.mood});

  final String mood;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAccount,
          style: Styles.textStyle14.copyWith(color: kDesTextColor),
        ),
        const Text(' '),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kSignUpView, extra: mood);
          },
          child: Text(
            S.of(context).signUp,
            style: Styles.textStyle16.copyWith(color: kDesTextColor),
          ),
        ),
      ],
    );
  }
}
