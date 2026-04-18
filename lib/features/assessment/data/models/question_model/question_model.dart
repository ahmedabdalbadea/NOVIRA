import 'metadata.dart';
import 'question.dart';
import 'standard_answer.dart';

class QuestionModel {
  final Metadata metadata;
  final List<StandardAnswer> standardAnswers;
  List<Question> questions;

  QuestionModel({
    required this.metadata,
    required this.standardAnswers,
    required this.questions,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    metadata: json['metadata'],
    standardAnswers: (json['standard_answers']),
    questions: (json['questions']),
  );

  Map<String, dynamic> toJson() => {
    'metadata': metadata.toJson(),
    'standard_answers': standardAnswers.map((e) => e.toJson()).toList(),
    'questions': questions.map((e) => e.toJson()).toList(),
  };
}
