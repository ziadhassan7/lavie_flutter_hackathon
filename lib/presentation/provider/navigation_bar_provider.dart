import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier{
  static int screenIndex = 2;

  void navigateTo(int index) {
    screenIndex = index;
    notifyListeners();
  }
}