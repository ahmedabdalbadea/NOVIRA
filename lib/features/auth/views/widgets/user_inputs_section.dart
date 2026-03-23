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
  String? _fullName, _email, _password, _confirmPassword;
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
            onChanged: (value) {
              _fullName = value;
            },

            validator: (value) {
              return requiredFieldValidator(value);
            },
          ),
          const SizedBox(height: 16),
          UserInput(
            prefixIcon: Icons.email_outlined,
            label: S.of(context).email,
            hintText: S.of(context).emailHint,
            onChanged: (value) {
              _email = value;
            },
            validator: (value) {
              return requiredFieldValidator(value);
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
              return requiredFieldValidator(value);
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
              return confirmPasswordValidator(value);
            },
          ),
          const SizedBox(height: 24),

          CustomElevatedButton(
            gradientColors: kSecGradientColors,
            title: S.of(context).createAccount,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                print(_fullName);
                print(_email);
                print(_password);
                print(_confirmPassword);
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

  String? confirmPasswordValidator(String? value) {
    String? re = requiredFieldValidator(value);
    if (re == null) {
      return _password == _confirmPassword ? null : "Passwords do not match";
    } else {
      return re;
    }
  }

  String? requiredFieldValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return "Field is required";
    } else {
      return null;
    }
  }
}
