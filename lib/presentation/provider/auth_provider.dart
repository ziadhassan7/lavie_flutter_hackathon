import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  static bool rememberMe = false;
  static String? _globalAuth;

  toggleRememberMe(){
    rememberMe = !rememberMe;
    notifyListeners();
  }

  ///----------------------------------------------
  static setGlobalAuth(String authKey){
    _globalAuth = authKey;
  }

  static get globalAuth => _globalAuth;
  ///----------------------------------------------
}