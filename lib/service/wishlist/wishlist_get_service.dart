import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../model/wishlist/wishlist_get_model.dart';

class WishlistGetService {
  static Future<List<WishlistGetModel>?> wishlistGetService(context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();
    try {
      log('getDone');
      final token = await storage.read(key: 'token');

      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.wishlist,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );

      if (response.statusCode! == 200) {
        final List<WishlistGetModel> wishlistModel =
            (response.data as List).map((e) {
          return WishlistGetModel.fromJson(e);
        }).toList();
        return wishlistModel;
      }
      if (response.statusCode! == 204) {
        return [];
      }
    } catch (e) {
      AppException.handleError(e, context);
      log('getProblem');
    }
    return null;
  }
}
