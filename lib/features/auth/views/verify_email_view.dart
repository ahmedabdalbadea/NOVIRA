import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/auth/views/widgets/verify_email_view_body.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const GradientScaffold(
      body: SafeArea(
        child: VerifyEmailViewBody(),
      ),
    );
  }
}
