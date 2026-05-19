import 'package:flutter/material.dart';
import 'package:novira_app/features/home/view/widgets/ai_chat_text_field.dart';
import 'package:novira_app/features/home/view/widgets/bubble_chat.dart';
import 'package:novira_app/features/home/view/widgets/chat_ai_bar.dart';

class AiChatViewBody extends StatelessWidget {
  const AiChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatAiBar(),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BubbleChat(
            text:
                "Hi Ahmed 💙\nI'm here for you. What's been on your mind today?",
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BubbleChat(text: "i feel anxious", isUser: true),
        ),
        Expanded(child: const SizedBox()),
        const SizedBox(height: 16),
        AiChatTextField(),
      ],
    );
  }
}
