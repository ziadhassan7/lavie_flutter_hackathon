import 'dart:io';
import 'package:flutter/material.dart';

class PickedImageProvider extends ChangeNotifier{

  bool isPicked = false;
  File? pickedImage;

  void viewPickedImage(File file) {
    isPicked = true;
    pickedImage = file;

    notifyListeners();
  }

  void reset () {
    isPicked = false;
    pickedImage = null;
    notifyListeners();
  }
}