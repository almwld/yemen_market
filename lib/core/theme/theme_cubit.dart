import 'package:flutter/material.dart';

class ThemeCubit extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setLight() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDark() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setSystem() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }
}
