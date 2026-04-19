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
    metadata: Metadata.fromJson(json['metadata']),
    standardAnswers: (json['standard_answers'] as List)
        .map((e) => StandardAnswer.fromJson(e))
        .toList(),
    questions: (json['questions'] as List)
        .map((e) => Question.fromJson(e))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'metadata': metadata.toJson(),
    'standard_answers': standardAnswers.map((e) => e.toJson()).toList(),
    'questions': questions.map((e) => e.toJson()).toList(),
  };
}
