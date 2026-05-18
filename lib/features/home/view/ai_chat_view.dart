import 'package:flutter/material.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';
import 'package:novira_app/features/home/view/widgets/ai_chat_view_body.dart';

class AiChatView extends StatelessWidget {
  const AiChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SafeArea(top: false, child: AiChatViewBody()),
    );
  }
}
