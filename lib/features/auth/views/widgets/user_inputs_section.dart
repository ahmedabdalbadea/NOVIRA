import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/auth/views/widgets/user_input.dart';
import 'package:novira_app/features/auth/views/widgets/user_password_input.dart';
import 'package:novira_app/generated/l10n.dart';

class UserInputsSection extends StatefulWidget {
  const UserInputsSection({super.key});

  @override
  State<UserInputsSection> createState() => _UserInputsSectionState();
}

class _UserInputsSectionState extends State<UserInputsSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
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
          UserPasswordInput(
            prefixIcon: Icons.lock_outline,
            lable: S.of(context).password,
            hintText: S.of(context).createPassword,
            suffixIcon: Icons.visibility_outlined,
          ),
          const SizedBox(height: 16),
          UserPasswordInput(
            prefixIcon: Icons.lock_outline,
            lable: S.of(context).confirmPassword,
            hintText: S.of(context).confirmPasswordHint,
            suffixIcon: Icons.visibility_outlined,
          ),
          const SizedBox(height: 24),

          CustomElevatedButton(
            gradientColors: kSecGradientColors,
            title: S.of(context).createAccount,
            onPressed: () {
              if (formKey.currentState!.validate()) {
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
