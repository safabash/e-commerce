import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';
import '../../model/home/home_product_model.dart';

class HomeProductService {
  Future<Products?> getAllProducts() async {
    // List<ProductModel> productList = [];
    try {
      final dio = Dio();
      Response response =
          await dio.get(ApiBaseUrl.baseUrl + ApiEndPoints.products);
      log('homeproduct');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        log('homeproduct2');
        Products product = Products.fromJson(response.data);
        log('homeproduct3');
        return product;
      }
    } catch (e) {
      log(e.toString());
      //AppException.handleError(e, context);
    }
    return null;
  }
}
