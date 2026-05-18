import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';

class ChatAiIconButton extends StatelessWidget {
  const ChatAiIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(icon, color: kDesTextColor),
      ),
    );
  }
}
