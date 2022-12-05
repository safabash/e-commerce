import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/category/category_product_model.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/api/api_base_url.dart';
import '../../core/api/api_end_points.dart';

class CategoryProductService {
  Future<List<CategoryProductsModel>?> getAllCategoryProducts(
      String categoryId, context) async {
    // List<ProductModel> productList = [];
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    try {
      log(categoryId);
      final dio = Dio();
      Response response = await dio.get(
          ApiBaseUrl.baseUrl + ApiEndPoints.categoryProducts + categoryId,
          options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());

        List<CategoryProductsModel> product = (response.data as List)
            .map((e) => CategoryProductsModel.fromJson(e))
            .toList();

        return product;
      }
    } catch (e) {
      log(e.toString());
      AppException.handleError(e, context);
    }
    return [];
  }
}
