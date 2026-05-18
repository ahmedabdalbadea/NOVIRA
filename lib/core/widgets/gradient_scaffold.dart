import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.extendBody = false,
    this.appBar,
  });
  final Widget? body, bottomNavigationBar;
  final bool extendBody;
  final PreferredSizeWidget? appBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [kStartPrimaryGradientColor, kEndPrimaryGradientColor],
        ),
      ),
      child: Scaffold(
        appBar: appBar,
        extendBody: extendBody,
        backgroundColor: Colors.transparent,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
