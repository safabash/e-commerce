import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/authentication/log_in_model.dart';
import 'package:e_commerce_app/view/constants.dart';
import 'package:e_commerce_app/view/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInService {
  Future<void> signInServide(LogInModel model, context) async {
    final dio = Dio();
    try {
      final Response<Map<String, dynamic>> response = await dio.post(
        baseUrl + loginUrl,
        data: model.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: response.data!['token']);
        final token = await storage.read(key: 'token');
        log(token.toString());

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
      }
    } on DioError catch (e) {
      log(e.response?.data['message']);
    }
  }
}
