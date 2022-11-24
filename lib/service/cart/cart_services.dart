import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/model/cart/cart_get_model.dart';
import 'package:e_commerce_app/model/cart/cart_post_model.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';

class CartService {
  static Future<bool?> cartPostService(CartPostModel model, context) async {
    final dio = Dio();
    const userId = '6364b7a01073e717b35c5a55';
    try {
      final Response response = await dio.post(
          ApiBaseUrl.baseUrl + ApiEndPoints.postProductToCart + userId,
          data: model.toJson());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return response.data['status'];
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }

  static Future<CartGetProducts?> cartGetService(context) async {
    final dio = Dio();
    const userId = '6364b7a01073e717b35c5a55';
    try {
      final Response response = await dio
          .get(ApiBaseUrl.baseUrl + ApiEndPoints.postProductToCart + userId);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return CartGetProducts.fromJson(response.data);
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
