import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';
import '../../model/cart/cart_get_model.dart';
import '../../utils/exceptions/api_exceptions.dart';

class CartGetService {
  static Future<CartGetProducts?> cartGetService(context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    log(token.toString());
    try {
      final Response response = await dio.get(
          ApiBaseUrl.baseUrl + ApiEndPoints.postProductToCart,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return CartGetProducts.fromJson(response.data);
      }
    } catch (e) {
      // AppException.handleError(e, context);
    }
    return null;
  }
}
