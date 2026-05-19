import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/assets_data.dart';
import 'package:novira_app/core/utils/styles.dart';

class BubbleChat extends StatelessWidget {
  const BubbleChat({super.key, this.isUser = false, required this.text});
  final bool isUser;
  final String text;
  @override
  Widget build(BuildContext context) {
    return isUser ? UserBubbleChat(text: text) : AiBubbleChat(text: text);
  }
}

class AiBubbleChat extends StatelessWidget {
  const AiBubbleChat({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9999),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kStartSecGradientColor, kEndSecGradientColor],
              ),
            ),

            child: Image.asset(AssetsData.kAiIcon, width: 40, height: 40),
          ),
          const SizedBox(width: 12),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.widthOf(context) * 0.7,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: kEndSecGradientColor.withValues(alpha: 0.11),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              width: MediaQuery.widthOf(context) * 0.7,
              child: Text(
                text,
                style: Styles.textStyle16.copyWith(height: 1.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserBubbleChat extends StatelessWidget {
  const UserBubbleChat({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.widthOf(context) * 0.7,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: kPrimaryColor.withValues(alpha: 0.30),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(text, style: Styles.textStyle16.copyWith(height: 1.7)),
          ),
        ),
      ),
    );
  }
}
