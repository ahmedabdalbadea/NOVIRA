import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/features/home/view/widgets/back_icon_button.dart';

class AiChatViewBody extends StatelessWidget {
  const AiChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            BackIconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
