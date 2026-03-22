import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/auth/views/widgets/user_input.dart';
import 'package:novira_app/generated/l10n.dart';

class UserInputsSection extends StatefulWidget {
  const UserInputsSection({super.key});

  @override
  State<UserInputsSection> createState() => _UserInputsSectionState();
}

class _UserInputsSectionState extends State<UserInputsSection> {
  String? fullName, email, password, confirmPassword;
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
            onChanged: (value) {
              fullName = value;
            },
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.email_outlined,
            lable: S.of(context).email,
            hintText: S.of(context).emailHint,
            onChanged: (value) {
              email = value;
            },
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.lock_outline,
            lable: S.of(context).password,
            hintText: S.of(context).createPassword,
            onChanged: (value) {
              password = value;
            },
            isPassword: true,
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.lock_outline,
            lable: S.of(context).confirmPassword,
            hintText: S.of(context).confirmPasswordHint,
            onChanged: (value) {
              confirmPassword = value;
            },
            isPassword: true,
          ),
          const SizedBox(height: 24),

          CustomElevatedButton(
            gradientColors: kSecGradientColors,
            title: S.of(context).createAccount,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                print(fullName);
                print(email);
                print(password);
                print(confirmPassword);
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
