import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier {
  String local = 'en';

  void ChangeLanguage(String langCode) {
    local = langCode;
    notifyListeners();
  }

  ThemeMode appTheme = ThemeMode.light;

  void ChangeTheme(newMode) {
    appTheme = newMode;
    notifyListeners();
  }
}
