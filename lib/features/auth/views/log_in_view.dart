import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/auth/views/widgets/log_in_view_body.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key, required this.moodMap});
  final Map<String, dynamic> moodMap;
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(child: LogInViewBody(moodMap: moodMap)),
    );
  }
}
