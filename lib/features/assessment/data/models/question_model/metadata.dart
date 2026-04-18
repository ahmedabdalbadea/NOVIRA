class Metadata {
  final int totalQuestions;
  final String type;
  final int frequencyDays;
  dynamic lastAssessmentDate;
  dynamic nextAssessmentDate;
  final int totalScore;

  Metadata({
    required this.totalQuestions,
    required this.type,
    required this.frequencyDays,
    this.lastAssessmentDate,
    this.nextAssessmentDate,
    required this.totalScore,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    totalQuestions: json['total_questions'],
    type: json['type'],
    frequencyDays: json['frequency_days'],
    lastAssessmentDate: json['last_assessment_date'] as dynamic,
    nextAssessmentDate: json['next_assessment_date'] as dynamic,
    totalScore: json['total_score'],
  );

  Map<String, dynamic> toJson() => {
    'total_questions': totalQuestions,
    'type': type,
    'frequency_days': frequencyDays,
    'last_assessment_date': lastAssessmentDate,
    'next_assessment_date': nextAssessmentDate,
    'total_score': totalScore,
  };
}
