import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';

import 'package:e_commerce_app/model/cart/cart_post_model.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartService {
  static Future<bool?> cartPostService(CartPostModel model, context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'token');

    try {
      final Response response = await dio.post(
          ApiBaseUrl.baseUrl + ApiEndPoints.postProductToCart,
          data: model.toJson(),
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return response.data['status'];
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
