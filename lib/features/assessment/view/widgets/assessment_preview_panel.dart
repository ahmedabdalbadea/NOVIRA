import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AssessmentPreviewPanel extends StatelessWidget {
  const AssessmentPreviewPanel({super.key});

  static const String _rocketLottieAsset =
      'assets/animations/businessman_rocket.json';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double targetHeight = (constraints.maxWidth * 0.56).clamp(
          180,
          260,
        );
        return Container(
          width: double.infinity,
          height: targetHeight,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(26),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Lottie.asset(
              _rocketLottieAsset,
              fit: BoxFit.contain,
              alignment: Alignment.center,
              repeat: true,
              frameRate: FrameRate.max,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 42,
                    color: Color(0xFF7F8C97),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
