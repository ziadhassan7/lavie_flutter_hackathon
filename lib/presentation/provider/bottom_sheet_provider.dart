import 'package:flutter/material.dart';

class BottomSheetProvider extends ChangeNotifier {
  bool isOpened = false;

  String? imageUrl;
  String? title;
  String? description;
  int? sunLight;
  int? waterCapacity;
  int? temperature;

  void show({
    imageUrl,
    title,
    description,
    sunLight,
    waterCapacity,
    temperature,
  }) {

    this.imageUrl = imageUrl;
    this.title = title;
    this.description = description;
    this.sunLight = sunLight;
    this.waterCapacity = waterCapacity;
    this.temperature = temperature;

    isOpened = true;
    notifyListeners();
  }


  void dismiss () {
    isOpened = false;
    notifyListeners();
  }

}