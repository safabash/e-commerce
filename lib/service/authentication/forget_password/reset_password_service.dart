import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/model/authentication/forgot_password/reset_password_model.dart';
import '../../../../utils/exceptions/api_exceptions.dart';

class ResetPasswordService {
  Future<String?> resetPassword(ResetPasswordModel model, context) async {
    try {
      Dio dio = Dio();
      print(model.toJson().toString());
      final response = await dio.put(
        ApiBaseUrl.baseUrl + ApiEndPoints.password,
        data: jsonEncode(model.toJson()),
      );
      print("object");
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data['message']);
        return response.data['message'];
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      AppException.handleError(e, context);
    }
    return null;
  }
}
