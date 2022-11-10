import 'dart:developer';

import 'package:e_commerce_app/service/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentOptionController with ChangeNotifier {
  late final razorpay;
  String selectedType = 'online';

  var options = {
    'key': 'rzp_test_0bHO2vUjKIyk ',
    'amount': 100,
    'name': 'Winx cloth',

    'description': 'Fine T-Shirt',
    'timeout': '5000', // in seconds
    'prefill': {
      'contact': '9123456789',
      'email': 'gaurav.kumar@example.com',
    }
  };

  void initRazorPay() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    log('success');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    log('failure');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log("external");
  }

  void radionButtonChange(String newValue) {
    selectedType = newValue;
    notifyListeners();
  }

  void goToPayment() {
    if (selectedType == 'online') {
      RazorPayService.razorPayService(razorpay, options);
    }
  }
}
