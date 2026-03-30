import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/features/auth/views/widgets/log_in_form_fields.dart';
import 'package:novira_app/features/auth/views/widgets/forgot_password_button.dart';
import 'package:novira_app/generated/l10n.dart';

class LogInUserInputsSection extends StatefulWidget {
  const LogInUserInputsSection({super.key});

  @override
  State<LogInUserInputsSection> createState() => _LogInUserInputsSectionState();
}

class _LogInUserInputsSectionState extends State<LogInUserInputsSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          LogInFormFields(
            emailValidator: _emailValidator,
            passwordValidator: _requiredFieldValidator,
          ),
          const SizedBox(height: 8),
          const ForgotPasswordButton(),
          const SizedBox(height: 16),
          CustomElevatedButton(
            gradientColors: kSecGradientColors,
            title: S.of(context).login,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
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

  String? _requiredFieldValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Field is required';
    }

    return null;
  }

  String? _emailValidator(String? value) {
    final requiredValidation = _requiredFieldValidator(value);
    if (requiredValidation != null) {
      return requiredValidation;
    }

    final isValidEmail = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(
      value!.trim(),
    );

    return isValidEmail ? null : 'Please enter a valid email';
  }
}
