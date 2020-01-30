import 'package:flutter/material.dart';

class HeroesInfo with ChangeNotifier {
  String _hero = 'Capitan America';



  String get hero => _hero;
  set hero(String value) {
    _hero = value;
    notifyListeners();
  }
}