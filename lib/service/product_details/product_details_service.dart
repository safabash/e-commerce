import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter/material.dart';

import '../../model/home/home_product_model.dart';

class SingleProductService {
  static Future<ProductElement?> getSingleProductService(
      String productId, BuildContext context) async {
    final dio = Dio();
    try {
      final response =
          await dio.get(ApiBaseUrl.baseUrl + ApiEndPoints.products + productId);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        ProductElement product = ProductElement.fromJson(response.data);
        return product;
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
