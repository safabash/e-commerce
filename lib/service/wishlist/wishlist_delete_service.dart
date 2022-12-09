import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../model/wishlist/wishlist_delete_model.dart';

class WishlistDeteteItemService {
  static Future<RemoveWishlistModel?> wishlistDeteteItemService(
      String productId, context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();
    try {
      log('deleted from wishlist');
      final token = await storage.read(key: 'token');

      final Response response = await dio.delete(
        ApiBaseUrl.baseUrl + ApiEndPoints.removewishlist + productId,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return RemoveWishlistModel.fromJson(response.data);
      }

      /*  Catch error   */

    } catch (e) {
      log('delete_problem');
      // AppException.handleError(e, context);
    }
    return null;
  }
}
