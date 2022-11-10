import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import '../../../utils/exceptions/api_exceptions.dart';
import '../../model/authentication/signup_model.dart';

class SignUpService {
  static Future<SignUpUserModel?> registerUser(
      SignUpUserModel model, context, phoneController) async {
    Dio dio = Dio();
    SignUpUserModel responseModel;
    try {
      log('first');
      final response = await dio.post(
          ApiBaseUrl.baseUrl + ApiEndPoints.registerUrl,
          data: model.toJson());
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        responseModel = SignUpUserModel.fromJson(response.data);
        return responseModel;
      }
    } on DioError catch (e) {
      log('error');
      AppException.handleError(e, context);
      log(e.toString());
    }
    return null;
  }
}
