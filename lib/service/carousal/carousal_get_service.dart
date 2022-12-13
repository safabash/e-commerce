import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/carousal/carousal_get_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';

import '../../utils/exceptions/api_exceptions.dart';

class CarousalGetService {
  static Future<CarousalModel?> carousalGetService(context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    log(token.toString());
    try {
      final Response response = await dio.get(
          ApiBaseUrl.baseUrl + ApiEndPoints.carousal,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return CarousalModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      AppException.handleError(e, context);
    }
    return null;
  }
}
