import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';

class WishlistPostService {
  static Future<bool?> wishlistPostService(String productId, context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');

    try {
      log('postDone');
      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.wishlist,
        data: {
          "productId": productId,
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data['status'];
      }
    } catch (e) {
      // AppException.handleError(e, context);
      log('post_wish_problem');
    }
    return false;
  }
}
