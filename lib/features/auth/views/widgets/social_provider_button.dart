import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';

class SocialProviderButton extends StatelessWidget {
  const SocialProviderButton({
    super.key,
    required this.icon,
    required this.title,
  });

  final FaIconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.7),
          boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 28, color: const Color(0xFF3F4B59)),
            const SizedBox(width: 12),
            Text(title, style: Styles.textStyle14.copyWith(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
