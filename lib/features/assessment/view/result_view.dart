import 'package:flutter/material.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/core/utils/styles.dart';
import 'package:novira_app/core/widgets/custom_elevated_button.dart';
import 'package:novira_app/core/widgets/gradient_scaffold.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key, required this.results});

  final Map<String, dynamic> results;

  @override
  Widget build(BuildContext context) {
    final int score = results['score'] ?? 0;
    final String status = results['status'] ?? 'Unknown';
    final String recommendation = results['recommendation'] ?? '';
    final bool needsDoctor = results['needsDoctor'] ?? false;
    final double rate = (results['rate'] ?? 0).toDouble();
    final String rateText = (rate % 1 == 0) ? rate.toInt().toString() : rate.toStringAsFixed(1);

    return GradientScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Check mark icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
                const SizedBox(height: 24),

                // Thank you title
                Text(
                  'Thank You for Sharing',
                  style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  'Based on your answers, here\'s your personalized insight:',
                  style: Styles.textStyle14.copyWith(color: kDesTextColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Score Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      // Circular Progress
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 150,
                            child: CircularProgressIndicator(
                              value: rate / 10,
                              strokeWidth: 8,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _getColorForScore(score),
                              ),
                              backgroundColor: Colors.white.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$rateText/10',
                                style: TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: _getColorForScore(score),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Status
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: _getColorForScore(score),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Rating label
                      Text(
                        'Rating out of 10',
                        style: Styles.textStyle12.copyWith(
                          color: kDesTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Recommendation Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: needsDoctor
                        ? Colors.red.withValues(alpha: 0.1)
                        : Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: needsDoctor
                          ? Colors.red.withValues(alpha: 0.3)
                          : Colors.green.withValues(alpha: 0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            needsDoctor ? Icons.warning : Icons.info,
                            color: needsDoctor ? Colors.red : Colors.green,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            needsDoctor ? 'Important Notice' : 'Keep It Up!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: needsDoctor ? Colors.red : Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        recommendation,
                        style: Styles.textStyle14.copyWith(
                          color: kDesTextColor,
                          height: 1.5,
                        ),
                      ),
                      if (needsDoctor) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Your responses suggest you may benefit from consulting with a healthcare professional.',
                            style: Styles.textStyle12.copyWith(
                              color: Colors.red[700],
                              fontWeight: FontWeight.w500,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Buttons
                CustomElevatedButton(
                  gradientColors: [
                    kStartSecGradientColor,
                    kEndSecGradientColor,
                  ],
                  title: 'Go to Home',
                  // Placeholder: intentionally no navigation so you can
                  // wire it later to the next page when ready.
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorForScore(int score) {
    if (score <= 4) {
      return Colors.green;
    } else if (score <= 9) {
      return Colors.cyan;
    } else if (score <= 14) {
      return Colors.orange;
    } else if (score <= 19) {
      return Colors.deepOrange;
    } else {
      return Colors.red;
    }
  }
}
