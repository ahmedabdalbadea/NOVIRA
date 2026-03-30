import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/generated/l10n.dart';

class SocialDividerSection extends StatelessWidget {
  const SocialDividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFE7E7E7))),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            S.of(context).orContinueWith,
            style: Styles.textStyle14.copyWith(color: Colors.black45),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xFFE7E7E7))),
      ],
    );
  }
}
