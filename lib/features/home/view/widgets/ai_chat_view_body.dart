import 'package:flutter/material.dart';
import 'package:novira_app/features/home/view/widgets/ai_chat_text_field.dart';
import 'package:novira_app/features/home/view/widgets/chat_ai_bar.dart';

class AiChatViewBody extends StatelessWidget {
  const AiChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatAiBar(),
        Expanded(child: const SizedBox()),
        AiChatTextField(),
      ],
    );
  }
}
