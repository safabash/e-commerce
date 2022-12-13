import 'dart:developer';

import 'package:e_commerce_app/model/address/address_get_model.dart';
import 'package:e_commerce_app/service/payment/payment_service.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../view/widgets/app_pop_up.dart';

class PaymentOptionController with ChangeNotifier {
  int index1 = 0;
  void cancelFunction() {
    if (index1 > 0) {
      index1 -= 1;
    }
    notifyListeners();
  }

  void continueFunction() {
    if (index1 <= 0 && index1 != 1) {
      index1 += 1;
    } else if (index1 == 1) {
      goToPayment();
    }
    notifyListeners();
  }

  void onStepTapped(index) {
    index1 = index;
    notifyListeners();
  }

  String selectedType = 'online';
  final razorpay = Razorpay();
  bool isSuccess = false;

  var options = {
    'key': 'rzp_test_43WHhfpaRYMT5P',
    'amount': '10000',
    'name': 'Quick Shope',
    'description': 'Dresses',
    'timeout': "300",
    'prefill': {
      'contact': '8086686886',
      'email': 'quickshope@gmail.com',
    }
  };

  void razorPayInitFn() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response, context) {
    AppPopUp.showToast(
      context,
      'Payment Success',
      Colors.green,
    );

    isSuccess = true;
    notifyListeners();
  }

  void _handlePaymentError(PaymentFailureResponse response, context) {
    AppPopUp.showToast(context, 'Payment Faild', Colors.red);
    log('Payment Faild');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    log('Payment ExternalWallet');
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
