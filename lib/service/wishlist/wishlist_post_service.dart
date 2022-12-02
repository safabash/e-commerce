import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';

class WishlistPostService {
  static Future<bool> wishlistPostService(String productId, context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');

    try {
      log('called addto Wishlist fuction');

      log('get token :$token');
      /*  call api key   */

      final Response response = await dio.post(
        ApiBaseUrl.baseUrl + ApiEndPoints.wishlist,
        data: {
          "productId": productId,
        },
        options: Options(headers: {"Authorization": "Bearer $token"}),
      );
      log('api called success');

      /*  check status code is Succes or bad requist   */

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        return response.data['status'];
      }

      /*  Catch error   */

    } catch (e) {
      log('Reg Error catched');
      AppException.handleError(e, context);
    }
    return false;
  }
}
