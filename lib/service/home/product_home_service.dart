import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';
import '../../model/home/home_product_model.dart';

class HomeProductService {
  Future<List<Products>?> getAllProducts() async {
    // List<ProductModel> productList = [];
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    try {
      final dio = Dio();
      Response response = await dio.get(
          ApiBaseUrl.baseUrl + ApiEndPoints.products,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      log('homeproduct');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        log('homeproduct2');
        List<Products> product =
            (response.data as List).map((e) => Products.fromJson(e)).toList();
        log('homeproduct3');
        return product;
      }
    } catch (e) {
      log(e.toString());
      //AppException.handleError(e, context);
    }
    return [];
  }
}
