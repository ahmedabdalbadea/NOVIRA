import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, this.body});
  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: kBackgroundGradient),
      child: Scaffold(backgroundColor: Colors.transparent),
    );
  }
}
