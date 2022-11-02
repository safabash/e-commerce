import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/authentication/otp_model.dart';
import 'package:e_commerce_app/service/exceptions/api_exceptions.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api_end_points/api_end_points.dart';

class OtpService {
  static Future<OtpModel?> signUpOtpService(
    OtpModel model,
    bool isLoading,
    context,
    String code,
  ) async {
    final dio = Dio();
    OtpModel responseModel;

    try {
      isLoading = true;
      final response =
          await dio.post(ApiEndPoints.baseUrl + ApiEndPoints.otpUrl, data: {
        "user": model.toJson(),
        "code": code,
      });
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: response.data!['token']);
        final token = await storage.read(key: 'token');
        log(token.toString());
        responseModel = OtpModel.fromJson(response.data);
        return responseModel;
      }
    } on DioError catch (e) {
      AppException.handleError(e, context);
      isLoading = false;
    }
    return null;
  }
}
