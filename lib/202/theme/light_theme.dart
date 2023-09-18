import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;
  // ignore: non_constant_identifier_names
  Lightheme() {
    theme = ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.green),
        textTheme:
            ThemeData.light().textTheme.copyWith(titleMedium: TextStyle(fontSize: 25, color: _lightColor._textColor)));
  }
}

class _LightColor {
  final Color _textColor = Colors.black;
}
