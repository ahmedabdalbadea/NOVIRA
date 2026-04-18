class StandardAnswer {
  final String text;
  final int value;

  const StandardAnswer({required this.text, required this.value});

  factory StandardAnswer.fromJson(Map<String, dynamic> json) {
    return StandardAnswer(text: json['text'], value: json['value']);
  }

  Map<String, dynamic> toJson() => {'text': text, 'value': value};
}
