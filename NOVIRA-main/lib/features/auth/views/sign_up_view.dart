import 'package:flutter/material.dart';
import 'package:novira_app/features/auth/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.mood});
  final String mood;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpViewBody(mood: mood));
  }
}
