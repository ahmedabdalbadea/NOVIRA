import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:novira_app/constants.dart';
import 'package:novira_app/features/assessment/data/models/risk_level_model.dart';

class ResultViewBody extends StatelessWidget {
  final int totalScore;
  final int maxScore;
  final int totalQuestions;
  final String assessmentType;

  const ResultViewBody({
    super.key,
    required this.totalScore,
    required this.maxScore,
    required this.totalQuestions,
    required this.assessmentType,
  });

  @override
  Widget build(BuildContext context) {
    final riskLevel = RiskLevel.calculateRiskLevel(totalScore, maxScore);
    final scoreOutOf10 = riskLevel.getScoreOutOfTen(maxScore);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            // Static Check Icon (color changes based on risk level)
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getColorForRiskLevel(riskLevel.label),
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Thank You Text
            const Text(
              'Thank You for Sharing',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Subtitle
            Text(
              'Based on your answers, here\'s your personalized insight:',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Score Card (rounded translucent background with circle)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withOpacity(0.06),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 160,
                    child: Center(child: _buildScoreCircle(scoreOutOf10, riskLevel)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Risk Level Label
            Text(
              riskLevel.label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _getColorForRiskLevel(riskLevel.label),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Important Notice (styled like screenshot)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFFBFB), Color(0xFFFFF4F4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFFFC9C9),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE35A5A).withOpacity(0.06),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE35A5A).withOpacity(0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.warning_rounded,
                          color: Color(0xFFE35A5A),
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Important Notice',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE35A5A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getWarningMessage(riskLevel),
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Color(0xFF5F5F5F),
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF0F0),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _getSupportMessage(riskLevel),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8E8E8E),
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            const SizedBox(height: 20),

            // Go to Home Button (gradient pill)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF55C6FF), Color(0xFF7CE6B9)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () => context.go('/home'),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Center(
                      child: Text(
                        'Go to Home',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildScoreCircle(double scoreOutOf10, RiskLevel riskLevel) {
    final color = _getColorForRiskLevel(riskLevel.label);

    final scoreText = scoreOutOf10.round().toString();

    final double value = (scoreOutOf10.clamp(0.0, 10.0)) / 10.0;
    const double diameter = 140.0;

    return SizedBox(
      width: diameter,
      height: diameter,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // background track
          SizedBox(
            width: diameter,
            height: diameter,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(color.withOpacity(0.12)),
            ),
          ),

          // foreground arc representing the score
          SizedBox(
            width: diameter,
            height: diameter,
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              backgroundColor: Colors.transparent,
            ),
          ),

          // score text + /10
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      scoreText,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: color,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        '/10',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[400],
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Color _getColorForRiskLevel(String label) {
    switch (label.toLowerCase()) {
      case 'good':
        return Colors.green;
      case 'concerning':
        return Colors.orange;
      case 'critical':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }

  String _getWarningMessage(RiskLevel riskLevel) {
    switch (riskLevel.label.toLowerCase()) {
      case 'good':
        return 'Your score looks reassuring, but keep an eye on any changes and continue healthy habits.';
      case 'concerning':
        return 'Your score suggests some symptoms may need attention. Monitoring and follow-up could help.';
      case 'critical':
        return 'Your score is high and deserves prompt medical attention for proper evaluation.';
      default:
        return 'We could not determine a clear result from the current score.';
    }
  }

  String _getSupportMessage(RiskLevel riskLevel) {
    switch (riskLevel.label.toLowerCase()) {
      case 'good':
        return 'If you notice new symptoms, consider discussing them with a healthcare professional.';
      case 'concerning':
        return 'A healthcare professional can help you understand these results and next steps.';
      case 'critical':
        return 'Please seek medical guidance as soon as possible.';
      default:
        return 'Please review your answers and retake the assessment if needed.';
    }
  }
}
