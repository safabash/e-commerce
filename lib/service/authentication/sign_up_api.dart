import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/view/authentication/otp.dart';

import 'package:e_commerce_app/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/authentication/signup_model.dart';

class SignUpService {
  static Future<void> registerUser(
      SignUpUserModel model, context, phoneController) async {
    Dio dio = Dio();
    try {
      final response =
          await dio.post(baseUrl + registerUrl, data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpPage(otpNumber: phoneController),
        ));
      }
    } on DioError catch (e) {
      log(e.toString());
    }
  }
}
