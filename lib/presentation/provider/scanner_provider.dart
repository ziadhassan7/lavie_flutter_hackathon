import 'package:flutter/material.dart';

class ScannerProvider extends ChangeNotifier {
  bool openBottomSheet = false;

  void show() {
    openBottomSheet = true;
    notifyListeners();
  }

  void dismiss() {
    openBottomSheet = false;
    notifyListeners();
  }
}