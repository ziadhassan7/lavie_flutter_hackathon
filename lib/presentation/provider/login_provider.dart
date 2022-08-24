import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  static bool rememberMe = false;
  static String? providerAuth;

  toggleRememberMe(){
    rememberMe = !rememberMe;
    notifyListeners();
  }

  static setProviderAuth(String authKey){
    providerAuth = authKey;
  }
}