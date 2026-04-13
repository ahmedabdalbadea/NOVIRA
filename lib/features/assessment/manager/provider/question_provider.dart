import 'package:flutter/material.dart';

class QuestionProvider extends ChangeNotifier {
  int _currentQuestion = 0;
  int? _questionsListLength;
  void nextQuestion() {
    if (_currentQuestion < _questionsListLength! - 1) {
      _currentQuestion++;
      notifyListeners();
    }
  }

  void perviousQuestion() {
    if (_currentQuestion > 0) {
      _currentQuestion--;
      notifyListeners();
    }
  }

  set setListLength(int length) {
    _questionsListLength = length;
  }

  int get currentQuestion => _currentQuestion;
}
