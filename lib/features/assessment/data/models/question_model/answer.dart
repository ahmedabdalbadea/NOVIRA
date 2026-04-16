import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String? answer;
  final bool? isSelected;
  final int? score;

  const Answer({this.answer, this.isSelected, this.score});

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    answer: json['answer'] as String?,
    isSelected: json['isSelected'] as bool?,
    score: json['score'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'answer': answer,
    'isSelected': isSelected,
    'score': score,
  };

  @override
  List<Object?> get props => [answer, isSelected, score];
}
