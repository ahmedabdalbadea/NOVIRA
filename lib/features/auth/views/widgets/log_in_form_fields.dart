import 'package:flutter/material.dart';
import 'package:novira_app/features/auth/views/widgets/user_input.dart';
import 'package:novira_app/generated/l10n.dart';

class LogInFormFields extends StatelessWidget {
  const LogInFormFields({
    super.key,
    required this.emailValidator,
    required this.passwordValidator,
  });

  final String? Function(String?) emailValidator;
  final String? Function(String?) passwordValidator;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInput(
          prefixIcon: Icons.email_outlined,
          label: S.of(context).email,
          hintText: S.of(context).emailHint,
          validator: emailValidator,
        ),
        const SizedBox(height: 16),
        UserInput(
          prefixIcon: Icons.lock_outline,
          label: S.of(context).password,
          hintText: S.of(context).enterPassword,
          isPassword: true,
          validator: passwordValidator,
        ),
      ],
    );
  }
}
