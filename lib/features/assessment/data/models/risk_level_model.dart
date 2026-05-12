class RiskLevel {
  final String label; // مثل "Concerning", "Normal", "Good"
  final double percentage;
  final String description;

  RiskLevel({
    required this.label,
    required this.percentage,
    required this.description,
  });

  /// حساب مستوى الخطورة بناءً على الـ score
  /// 
  /// الحد الأقصى للنقاط = عدد الأسئلة * 3
  /// المعادلة: (score / max_score) * 100
  static RiskLevel calculateRiskLevel(int score, int maxScore) {
    if (maxScore == 0) {
      return RiskLevel(
        label: 'Unknown',
        percentage: 0,
        description: 'Unable to calculate risk level',
      );
    }

    final percentage = (score / maxScore) * 100;

    if (percentage <= 33) {
      return RiskLevel(
        label: 'Good',
        percentage: percentage,
        description: 'Your current status is healthy.',
      );
    } else if (percentage <= 66) {
      return RiskLevel(
        label: 'Concerning',
        percentage: percentage,
        description: 'Please consult a healthcare professional.',
      );
    } else {
      return RiskLevel(
        label: 'Critical',
        percentage: percentage,
        description: 'Urgent consultation with a healthcare professional recommended.',
      );
    }
  }

  /// حساب النقاط من 10
  double getScoreOutOfTen(int maxScore) {
    if (maxScore == 0) return 0;
    final scoreOutOf10 = (percentage / 100) * 10;
    return double.parse(scoreOutOf10.toStringAsFixed(1));
  }
}
