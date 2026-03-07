import 'package:flutter/foundation.dart';

class MoodProvider extends ChangeNotifier {
  int _selectedItemIndex = -1;
  String? _selectedMood;

  int get selectedItemIndex => _selectedItemIndex;
  String? get selectedMood => _selectedMood;

  void selectMood(int index, String mood) {
    _selectedItemIndex = index;
    _selectedMood = mood;
    notifyListeners(); 
  }
}
