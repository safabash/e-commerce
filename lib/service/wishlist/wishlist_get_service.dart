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
      log('called add to WishList get fuction');
      final token = await storage.read(key: 'token');
      log('get token :$token');
      final Response response = await dio.get(
        ApiBaseUrl.baseUrl + ApiEndPoints.wishlist,
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('WishList Get response :${response.data}');
        final List<WishlistGetModel> wishlistModel =
            (response.data as List).map((e) {
          return WishlistGetModel.fromJson(e);
        }).toList();
        return wishlistModel;
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      AppException.handleError(e, context);
    }
    return null;
  }
}
