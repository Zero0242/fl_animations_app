import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  static bool _darkTheme = false;
  static bool _customTheme = false;

  bool get darkTheme => _darkTheme;
  set darkTheme(bool estado) {
    _customTheme = false;
    _darkTheme = estado;
    if (estado) {
      _currentTheme = ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.redAccent),
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

  bool get customTheme => _customTheme;
  set customTheme(bool estado) {
    _darkTheme = false;
    _customTheme = estado;
    notifyListeners();
  }

  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;
}
