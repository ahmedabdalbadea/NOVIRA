import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/auth/views/widgets/user_input.dart';
import 'package:novira_app/generated/l10n.dart';

class UserInputsSection extends StatelessWidget {
  const UserInputsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInput(
          lable: S.of(context).fullName,
          prefixIcon: Icons.person_outline,
          hintText: S.of(context).enterFullName,
        ),
        const SizedBox(height: 16),
        UserInput(
          prefixIcon: Icons.email_outlined,
          lable: S.of(context).email,
          hintText: S.of(context).emailHint,
        ),
        const SizedBox(height: 16),
        UserInput(
          prefixIcon: Icons.lock_outline,
          lable: S.of(context).password,
          hintText: S.of(context).createPassword,
          suffixIcon: Icons.visibility_outlined,
        ),
        const SizedBox(height: 16),
        UserInput(
          prefixIcon: Icons.lock_outline,
          lable: S.of(context).confirmPassword,
          hintText: S.of(context).confirmPasswordHint,
          suffixIcon: Icons.visibility_outlined,
        ),
        const SizedBox(height: 24),

        CustomElevatedButton(
          gradientColors: kSecGradientColors,
          title: S.of(context).createAccount,
        ),
      ],
    );
  }
}
