import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  static bool rememberMe = false;

  toggleRememberMe(){
    rememberMe = !rememberMe;
    notifyListeners();
  }
}