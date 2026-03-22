import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageProvider extends ChangeNotifier {
  String _language = "en";
  TextTheme _textTheme = GoogleFonts.nunitoTextTheme();
  String get language => _language;

  TextTheme get textTheme => _textTheme;

  set language(String language) {
    _language = language;
    _changetextTheme();
    notifyListeners();
  }

  void _changetextTheme() {
    _textTheme = _language == "en"
        ? GoogleFonts.nunitoTextTheme()
        : GoogleFonts.cairoTextTheme();
    notifyListeners();
  }
}
