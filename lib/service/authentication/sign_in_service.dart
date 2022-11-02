import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/authentication/log_in_model.dart';
import 'package:e_commerce_app/service/exceptions/api_exceptions.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api_end_points/api_end_points.dart';

class SignInService {
  Future<LogInModel?> signInServide(LogInModel model, context) async {
    final dio = Dio();
    LogInModel responseModel;
    try {
      final Response<Map<String, dynamic>> response = await dio.post(
        ApiEndPoints.baseUrl + ApiEndPoints.loginUrl,
        data: model.toJson(),
      );
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: response.data!['token']);
        final token = await storage.read(key: 'token');
        log(token.toString());
        responseModel = LogInModel.fromJson(response.data!);

        return responseModel;
      }
    } on DioError catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
