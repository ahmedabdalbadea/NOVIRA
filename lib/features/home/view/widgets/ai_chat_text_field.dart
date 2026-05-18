import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/home/view/widgets/chat_ai_icon_button.dart';

class AiChatTextField extends StatelessWidget {
  const AiChatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(22),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ChatAiIconButton(
            icon: Icons.sentiment_satisfied_outlined,
            onPressed: () {},
          ),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: _buildBorder(),
                enabledBorder: _buildBorder(),
                focusedBorder: _buildBorder(),
                disabledBorder: _buildBorder(),
                hintText: "Type your thoughts here…",
                hintStyle: Styles.textStyle14.copyWith(color: kDesTextColor),
              ),
            ),
          ),
          ChatAiIconButton(icon: Icons.mic, onPressed: () {}),
          ChatAiIconButton(icon: Icons.send, onPressed: () {}),
        ],
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
