import 'package:flutter/foundation.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = "en";

  String get language => _language;

  set changLanguage(String language) {
    _language = language;
    notifyListeners();
  }
}
