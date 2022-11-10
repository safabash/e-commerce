import 'package:e_commerce_app/view/cart/cart.dart';
import 'package:e_commerce_app/view/payment/payment.dart';
import 'package:flutter/material.dart';

class SingleProductController with ChangeNotifier {
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
}
