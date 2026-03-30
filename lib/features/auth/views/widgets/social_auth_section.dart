import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'social_divider_section.dart';
import 'social_provider_button.dart';

class SocialAuthSection extends StatelessWidget {
  const SocialAuthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SocialDividerSection(),
        const SizedBox(height: 16),
        Row(
          children: const [
            Expanded(
              child: SocialProviderButton(
                icon: FontAwesomeIcons.google,
                title: 'Google',
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: SocialProviderButton(
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
