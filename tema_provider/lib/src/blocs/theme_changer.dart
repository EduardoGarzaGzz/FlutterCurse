import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  ThemeChanger(this._themeData);

  ThemeData get getTheme => _themeData;

  set setTheme(ThemeData value) {
    _themeData = value;
    notifyListeners();
  }
}
