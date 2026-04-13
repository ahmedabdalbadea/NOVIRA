import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/app_router.dart';
import 'package:novira_app/core/utils/app_validators.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/auth/views/widgets/user_input.dart';
import 'package:novira_app/generated/l10n.dart';

class UserInputsSection extends StatefulWidget {
  const UserInputsSection({super.key});

  @override
  State<UserInputsSection> createState() => _UserInputsSectionState();
}

class _UserInputsSectionState extends State<UserInputsSection> {
  String? _password, _confirmPassword;
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
            label: S.of(context).fullName,
            prefixIcon: Icons.person_outline,
            hintText: S.of(context).enterFullName,
            validator: (value) {
              return AppValidators.requiredFieldValidator(context, value);
            },
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.email_outlined,
            label: S.of(context).email,
            hintText: S.of(context).emailHint,
            validator: (value) {
              return AppValidators.emailValidator(context, value);
            },
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.lock_outline,
            label: S.of(context).password,
            hintText: S.of(context).createPassword,
            onChanged: (value) {
              _password = value;
            },
            isPassword: true,
            validator: (value) {
              return AppValidators.requiredFieldValidator(context, value);
            },
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.lock_outline,
            label: S.of(context).confirmPassword,
            hintText: S.of(context).confirmPasswordHint,
            onChanged: (value) {
              _confirmPassword = value;
            },
            isPassword: true,
            validator: (value) {
              return AppValidators.confirmPasswordValidator(
                context,
                value,
                password: _password,
                confirmPassword: _confirmPassword,
              );
            },
          ),
          const SizedBox(height: 24),

          CustomElevatedButton(
            gradientColors: [kStartSecGradientColor, kEndSecGradientColor],
            title: S.of(context).createAccount,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.push(AppRouter.kVerifyEmailView);
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
