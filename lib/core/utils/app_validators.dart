import 'package:flutter/material.dart';
import 'package:novira_app/generated/l10n.dart';

class AppValidators {
  static String? requiredFieldValidator(BuildContext context, String? value) {
    if (value?.trim().isEmpty ?? true) {
      return S.of(context).fieldRequired;
    } else {
      return null;
    }
  }

  static String? emailValidator(BuildContext context, String? value) {
    final requiredValidation = requiredFieldValidator(context, value);
    if (requiredValidation != null) {
      return requiredValidation;
    }

    final isValidEmail = RegExp(
      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
    ).hasMatch(value!.trim());

    return isValidEmail ? null : S.of(context).invalidEmail;
  }

  static String? confirmPasswordValidator(
    BuildContext context,
    String? value, {
    String? password,
    String? confirmPassword,
  }) {
    String? re = requiredFieldValidator(context, value);
    if (re == null) {
      return password == confirmPassword
          ? null
          : S.of(context).passwordsDoNotMatch;
    } else {
      return re;
    }
  }
}
