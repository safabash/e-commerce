import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  int itemcount = 1;
  void itemCountIncrease() {
    itemcount++;
    notifyListeners();
  }

  void itemCountDecrease() {
    if (itemcount > 1) {
      itemcount--;
    } else {
      return;
    }
    notifyListeners();
  }
}
