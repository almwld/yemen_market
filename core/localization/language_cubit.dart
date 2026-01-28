import 'package:flutter/material.dart';

class LanguageCubit extends ChangeNotifier {
  static Locale _locale = const Locale('ar');

  static Locale get currentLocale => _locale;

  void setArabic() {
    _locale = const Locale('ar');
    notifyListeners();
  }

  void setEnglish() {
    _locale = const Locale('en');
    notifyListeners();
  }
}
