import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/authentication/otp_model.dart';
import 'package:e_commerce_app/view/home/home_page.dart';
import 'package:e_commerce_app/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../view/constants.dart';

class OtpService {
  static Future<void> signUpOtpService(
      OtpModel model, bool isLoading, context) async {
    final dio = Dio();
    try {
      isLoading = true;
      final response = await dio.post(baseUrl + otpUrl, data: model.toJson());

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: response.data!['token']);
        final token = await storage.read(key: 'token');
        log(token.toString());
        showToast(context, 'Created Successfully');
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      }
    } on DioError catch (e) {
      isLoading = false;
      return e.response!.data;
    }
  }
}
