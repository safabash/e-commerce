import 'dart:developer';

import 'package:e_commerce_app/model/authentication/forgot_password/reset_password_model.dart';
import 'package:e_commerce_app/service/authentication/forget_password/reset_password_service.dart';

import 'package:e_commerce_app/view/authentication/login.dart';
import 'package:flutter/material.dart';

class ResetController with ChangeNotifier {
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  void obscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  bool isLoading = false;
  resetPassword(ResetPasswordModel model, BuildContext context) async {
    isLoading = true;
    notifyListeners();
    ResetPasswordService().resetPassword(model, context).then((value) {
      if (value != null) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LogIn(),
            ),
            (route) => false);
      } else {
        log('caaaalled');
        return;
      }
    });
    isLoading = false;
    notifyListeners();
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "Enter 6 character password";
    }
    if (value.length < 7) {
      return 'Enter 6 characters';
    } else {
      return null;
    }
  }
}
