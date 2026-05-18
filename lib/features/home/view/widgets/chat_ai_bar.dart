import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/features/home/view/widgets/ai_icon.dart';
import 'package:novira_app/features/home/view/widgets/back_icon_button.dart';

class ChatAiBar extends StatelessWidget {
  const ChatAiBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.paddingOf(context).top + 16,
        bottom: 16.0,
        left: 24,
        right: 24,
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BackIconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),

          Column(
            children: [
              Text("NOVIRA AI", style: Styles.textStyle18),
              Text(
                "Your Safe Space to Talk",
                style: Styles.textStyle12.copyWith(color: kDesTextColor),
              ),
            ],
          ),

          SizedBox(height: 50, width: 50, child: AiIcon()),
        ],
      ),
    );
  }
}
