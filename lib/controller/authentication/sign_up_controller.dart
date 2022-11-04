import 'package:e_commerce_app/model/authentication/signup_model.dart';
import 'package:e_commerce_app/service/authentication/sign_up_api.dart';
import 'package:e_commerce_app/view/authentication/otp.dart';
import 'package:flutter/material.dart';

import '../../model/authentication/otp_enum_model.dart';

class SignUpController with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final isLoading = false;
  Future<void> registerUser(context, formKey) async {
    if (formKey.currentState!.validate()) {
      final user = SignUpUserModel(
          username: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text);
      await SignUpService.registerUser(user, context, phoneController.text)
          .then((value) {
        if (value != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => OtpPage(
                  otpNumber: phoneController.toString(),
                  type: ActionType.register,
                ),
              ),
              (route) => false);
        }
      });
    }
  }

  String? nameValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  bool isValidEmail(value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  String? passwordValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value.length < 6) {
      return 'Please enter 6 characters';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value != passwordController.text) {
      return "Password does't match ";
    }
    return null;
  }

  String? phoneValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value.length < 10) {
      return 'Please enter 10 digits';
    }
    return null;
  }

  void disposeField() {
    nameController.clear();
    passwordController.clear();
    emailController.clear();
    confirmPasswordController.clear();
    phoneController.clear();
  }

  void navigateToOtp(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpPage(
                  type: ActionType.register,
                  otpNumber: phoneController.text,
                )));
  }
}
