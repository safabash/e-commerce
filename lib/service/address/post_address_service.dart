import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/address/address_post_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';
import '../../utils/exceptions/api_exceptions.dart';

class AddressPostService {
  static Future<bool> postAddress(AddressPostModel model, context) async {
    Dio dio = Dio();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');
    try {
      final response = await dio.post(ApiBaseUrl.baseUrl + ApiEndPoints.address,
          data: model.toJson(),
          options: Options(headers: {"Authorization": "Bearer $token"}));
      log(response.statusCode.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return response.data['success'];
      }
    } on DioError catch (e) {
      log('error');
      AppException.handleError(e, context);
      log(e.toString());
    }
    return false;
  }
}
