import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/core/widgets/custom_logo.dart';
import 'package:novira_app/features/splash/views/widgets/onboarding_card_body.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/features/auth/views/widgets/user_input.dart';
import 'package:novira_app/generated/l10n.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: OnboardingCardBody(
                body: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      const CustomLogo(),
                      const SizedBox(height: 32),
                      Text(
                        S.of(context).forgot_password,
                        style: Styles.textStyle30,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        S.of(context).instruction_password,
                        textAlign: TextAlign.center,
                        style: Styles.textStyle14.copyWith(color: Colors.black45),
                      ),
                      const SizedBox(height: 32),
                      UserInput(
                        prefixIcon: Icons.email_outlined,
                        label: S.of(context).email_address,
                        hintText: S.of(context).emailHint,
                        validator: _emailValidator,
                      ),
                      const SizedBox(height: 24),
                      CustomElevatedButton(
<<<<<<< HEAD
                        gradientColors: kSecGradientColors,
                        title: S.of(context).button_send,
=======
                        gradientColors: const [
                          Color(0xFFA5A4D9),
                          Color(0xFFEAA08F),
                        ],
                        title: 'Send Reset Link',
>>>>>>> 63e93ffd04b5d994530ffab22ccd1391a657d96d
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            // TODO: Send reset email
                          } else {
                            setState(() {
                              autovalidateMode = AutovalidateMode.always;
                            });
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () => context.pop(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                              color: kDesTextColor,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              S.of(context).back_to_login,
                              style: Styles.textStyle14.copyWith(
                                color: kDesTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String? _emailValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return 'Email is required';
    }

    final isValidEmail = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(
      value!.trim(),
    );

    return isValidEmail ? null : 'Please enter a valid email';
  }
}
