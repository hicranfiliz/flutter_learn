//
import 'package:flutter/material.dart';

// Eger bundan diger sayfalar etkilenecekse bu class'i ChangeNotifier'dan turetmemiz gerekiyor.
class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? ThemeData.light() : ThemeData.dark();
}
