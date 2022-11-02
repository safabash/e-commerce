import 'dart:developer';

import 'package:e_commerce_app/model/authentication/log_in_model.dart';
import 'package:e_commerce_app/service/authentication/sign_in_service.dart';
import 'package:e_commerce_app/view/authentication/forget_password.dart';
import 'package:flutter/material.dart';

import '../../view/home/home_page.dart';

class LogInController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool passwordVisible = true;
  void passwordVisibility() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  String? nameValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  String? passwordValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    } else if (value.length < 6) {
      return "enter 6 digits";
    }
    return null;
  }

  Future<void> signIn(context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;

      notifyListeners();
      log(passwordController.text);
      log(emailController.text);
      final model = LogInModel(
        username: emailController.text,
        password: passwordController.text,
      );
      log('wone');
      await SignInService().signInServide(model, context).then((value) {
        if (value != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        }
        disposeTextfields();
      });
      isLoading = false;

      notifyListeners();
    }
  }

  void navigateToForgetPassword(context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ForgetPassword()));
  }

  void disposeTextfields() {
    emailController.clear();
    passwordController.clear();
  }
}
