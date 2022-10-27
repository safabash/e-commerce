import 'dart:async';

import 'package:e_commerce_app/model/authentication/otp_model.dart';
import 'package:e_commerce_app/model/authentication/signup_model.dart';
import 'package:e_commerce_app/service/authentication/otp_service.dart';
import 'package:e_commerce_app/view/widgets.dart';
import 'package:flutter/material.dart';

class OtpController with ChangeNotifier {
  final bool isLoading = false;
  int timeRemaining = 30;
  Timer? timer;
  bool enableResend = false;
  String code = '';
  void setCode(String newCode) {
    code = newCode;
    notifyListeners();
  }

  void setResendVisibility(bool newValue) {
    enableResend = newValue;
    timeRemaining = 30;
    notifyListeners();
  }

  void submitOtp(context, SignUpUserModel model) async {
    if (code.length != 4) {
      showToast(context, 'Enter OTP');
    } else {
      final verifyOtp = OtpModel(
          code: code,
          email: model.email,
          password: model.password,
          phone: model.phone,
          username: model.username);
      await OtpService.signUpOtpService(verifyOtp, isLoading, context);
    }
    notifyListeners();
  }

  void changeTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (timeRemaining != 0) {
        timeRemaining--;
        notifyListeners();
      } else {
        enableResend = true;
        notifyListeners();
      }
    });
  }
}
