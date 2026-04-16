import 'package:equatable/equatable.dart';

import 'answer.dart';

class QuestionModel extends Equatable {
  final String? desc;
  final String? question;
  final List<Answer>? answer;

  const QuestionModel({this.desc, this.question, this.answer});

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    desc: json['desc'] as String?,
    question: json['question'] as String?,
    answer: (json['answer'] as List<dynamic>?)
        ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'desc': desc,
    'question': question,
    'answer': answer?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [desc, question, answer];
}
