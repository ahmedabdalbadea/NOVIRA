class Question {
  final int id;
  final String category;
  final String desc;
  final String question;
  int? selectedValue;

  Question({
    required this.id,
    required this.category,
    required this.desc,
    required this.question,
    this.selectedValue,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    id: json['id'],
    category: json['category'],
    desc: json['desc'],
    question: json['question'],
    selectedValue: json['selected_value'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'desc': desc,
    'question': question,
    'selected_value': selectedValue,
  };
}
