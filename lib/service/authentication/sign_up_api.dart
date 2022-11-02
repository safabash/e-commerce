import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/service/exceptions/api_exceptions.dart';

import '../api_end_points/api_end_points.dart';
import '../../model/authentication/signup_model.dart';

class SignUpService {
  static Future<SignUpUserModel?> registerUser(
      SignUpUserModel model, context, phoneController) async {
    Dio dio = Dio();
    SignUpUserModel responseModel;
    try {
      final response = await dio.post(
          ApiEndPoints.baseUrl + ApiEndPoints.registerUrl,
          data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        responseModel = SignUpUserModel.fromJson(response.data);
        return responseModel;
      }
    } on DioError catch (e) {
      AppException.handleError(e, context);
      log(e.toString());
    }
  }
}
