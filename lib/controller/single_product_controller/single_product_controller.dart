import 'package:e_commerce_app/view/cart/cart.dart';
import 'package:e_commerce_app/view/payment/payment.dart';
import 'package:flutter/material.dart';

import '../../model/home/home_product_model.dart';
import '../../service/product_details/product_details_service.dart';
import '../../view/single_product_details.dart/single_product.dart';

class SingleProductController with ChangeNotifier {
  int selectedColor = 0;
  int selectedSize = 0;
  void setColor(newValue) {
    selectedColor = newValue;
    notifyListeners();
  }

  void setSize(newValue) {
    selectedSize = newValue;
    notifyListeners();
  }

  void goToPayment(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const PaymentOption();
    }));
  }

  void goToCart(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return const Cart();
    }));
  }

  bool isLoading = false;
  ProductElement? productElement;
  void getSingleProductDetails(String productId, context) async {
    isLoading = true;
    notifyListeners();
    await SingleProductService.getSingleProductService(productId, context)
        .then((value) {
      if (value != null) {
        productElement = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const SingleProduct();
        }));
      }
    });
    isLoading = false;
    notifyListeners();
  }
}
