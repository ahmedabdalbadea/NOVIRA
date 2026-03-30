import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:novira_app/core/utils/styles.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                'or continue with',
                style: Styles.textStyle14.copyWith(color: Colors.black45),
              ),
            ),
            const Expanded(child: Divider(color: Color(0xFFE7E7E7))),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: _SocialProviderButton(
                icon: FontAwesomeIcons.google,
                title: 'Google',
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: _SocialProviderButton(
                icon: FontAwesomeIcons.apple,
                title: 'Apple',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialProviderButton extends StatelessWidget {
  const _SocialProviderButton({required this.icon, required this.title});

  final FaIconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFF0F0F0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(icon, size: 28, color: const Color(0xFF3F4B59)),
            const SizedBox(width: 12),
            Text(title, style: Styles.textStyle30.copyWith(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}
