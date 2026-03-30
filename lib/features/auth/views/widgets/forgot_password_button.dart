import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/utils/app_router.dart';

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
          'Forgot Password?',
          style: Styles.textStyle14.copyWith(color: kDesTextColor),
        ),
      ),
    );
  }
}
