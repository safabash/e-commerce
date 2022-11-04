import 'dart:developer';

import 'package:e_commerce_app/model/authentication/otp_enum_model.dart';
import 'package:e_commerce_app/service/authentication/forget_password/forget_password_services.dart';
import 'package:e_commerce_app/view/authentication/otp.dart';
import 'package:flutter/material.dart';

class ForgetPasswordController with ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  bool isValidEmail(value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  void goToOtp(GlobalKey<FormState> formkey, context) async {
    if (formkey.currentState!.validate()) {
      await ForgetPasswordService.getOtpPassword(emailController.text, context)
          .then((value) {
        if (value != null) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpPage(
              otpNumber: emailController.text,
              type: ActionType.forgetPassword,
            ),
          ));
        } else
          log('called');
      });
    }
  }
}
