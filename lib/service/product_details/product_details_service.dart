import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../model/home/home_product_model.dart';

class SingleProductService {
  static Future<Products?> getSingleProductService(
      String productId, BuildContext context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    try {
      final response = await dio.get(
          ApiBaseUrl.baseUrl + ApiEndPoints.products + productId,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        Products product = Products.fromJson(response.data);
        return product;
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
