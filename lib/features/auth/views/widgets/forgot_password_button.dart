import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/generated/l10n.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: TextButton(
        onPressed: () {
          context.push(AppRouter.kForgotPasswordView);
        },
        child: Text(
          S.of(context).forgot_password,
          style: Styles.textStyle14.copyWith(color: kDesTextColor),
        ),
      ),
    );
  }
}
