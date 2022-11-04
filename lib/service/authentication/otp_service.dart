import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/model/authentication/forgot_password/verify_forgot_password_model.dart';
import 'package:e_commerce_app/model/authentication/otp_model.dart';
import '../../../utils/exceptions/api_exceptions.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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
      final response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.otpUrl,
        data: {
          "user": model.toJson(),
          "code": code,
        },
      );
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

  static Future<String?> verifyForgotPasswordOtp(
      VerifyForgetModel model, context) async {
    try {
      final dio = Dio();
      final response = await dio.post(
          ApiBaseUrl.baseUrl + ApiEndPoints.fogotOtpverification,
          data: json.encode(model.toJson()));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['message'];
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
