import 'package:flutter/foundation.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = "en";

  String get language => _language;

  set language(String language) {
    _language = language;
    notifyListeners();
  }
}
