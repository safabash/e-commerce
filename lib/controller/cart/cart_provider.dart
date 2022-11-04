import 'package:flutter/material.dart';

import '../../model/authentication/product_model.dart';

class CartProvider with ChangeNotifier {
  int itemcount = 1;
  void itemCountIncrease() {
    itemcount++;
    notifyListeners();
  }

  List<Product> cartList = [];
  void addToCart(Product product) {
    cartList.add(product);
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
