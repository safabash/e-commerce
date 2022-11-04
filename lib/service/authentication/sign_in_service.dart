import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/model/authentication/log_in_model.dart';
import '../../../utils/exceptions/api_exceptions.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignInService {
  Future<LogInModel?> signInServide(LogInModel model, context) async {
    final dio = Dio();
    LogInModel responseModel;
    try {
      final Response<Map<String, dynamic>> response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.loginUrl,
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
