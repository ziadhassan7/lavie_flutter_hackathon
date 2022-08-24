import 'package:flutter/material.dart';

import '../../data/controller/cart/cart_controller.dart';
import '../../data/controller/view_handler.dart';

class CartProvider extends ChangeNotifier {

  void deleteItem (String id) {
    CartController.deleteItem(id);

    print("deleted");

    notifyListeners();
  }

  void checkout (BuildContext context) {
    CartController.deleteAllItems();

    ViewHandler.showSnackBar(context, "Successfully purchased", duration: 1000);

    notifyListeners();
  }
}