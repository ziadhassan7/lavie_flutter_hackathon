import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier{
  String searchedText = "";
  //notifyListeners

  updateSearchItems (String text) {
    searchedText = text;
    notifyListeners();
  }

}