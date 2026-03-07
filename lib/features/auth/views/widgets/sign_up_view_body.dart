import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key, required this.mood});
  final String mood;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(mood, style: Styles.textStyle30));
  }
}
