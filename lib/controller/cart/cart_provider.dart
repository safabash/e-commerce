import 'package:e_commerce_app/model/cart/cart_get_model.dart';
import 'package:e_commerce_app/model/cart/cart_post_model.dart';
import 'package:e_commerce_app/service/cart/cart_services.dart';
import 'package:e_commerce_app/view/widgets/app_pop_up.dart';
import 'package:flutter/material.dart';

import '../../model/authentication/product_model.dart';

class CartProvider with ChangeNotifier {
  bool isLoading = false;
  int itemcount = 1;
  void itemCountIncrease() {
    itemcount++;
    notifyListeners();
  }

  // List<Product> cartList = [];
  // void addToCart(Product product) {
  //   cartList.add(product);
  //   notifyListeners();
  // }

  void itemCountDecrease() {
    if (itemcount > 1) {
      itemcount--;
    } else {
      return;
    }
    notifyListeners();
  }

  void addProductsToCart(String productId, String size, String color, context) {
    final cartModel =
        CartPostModel(productId: productId, size: size, color: color);
    isLoading = true;
    notifyListeners();
    CartService.cartPostService(cartModel, context);
    AppPopUp.showToast(context, 'Add to Cart', Colors.blue);
    isLoading = false;
    notifyListeners();
  }

  CartGetProducts? cartProducts;
  List<CartProduct>? cartProduct;
  void getAllCartProducts(context) async {
    isLoading = true;
    notifyListeners();
    await CartService.cartGetService(context).then((value) {
      if (value != null) {
        cartProducts = value;
        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    });
    isLoading = false;
    notifyListeners();
  }
}
