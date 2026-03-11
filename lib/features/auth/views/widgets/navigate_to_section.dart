import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/generated/l10n.dart';

class NavigateToSection extends StatelessWidget {
  const NavigateToSection({super.key, required this.mood});

  final String mood;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAccount,
          style: Styles.textStyle14.copyWith(color: kDesTextColor),
        ),
        Text("? ", style: Styles.textStyle14.copyWith(color: kDesTextColor)),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kLogInView, extra: mood);
          },
          child: Text(
            S.of(context).login,
            style: Styles.textStyle16.copyWith(color: kDesTextColor),
          ),
        ),
      ],
    );
  }
}
