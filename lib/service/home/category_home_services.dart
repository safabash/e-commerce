import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/model/home/home_category_model.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';

class HomeCategoriesService {
  static Future<List<HomeCategoryModel>> getAllCategories(context) async {
    log('df');
    List<HomeCategoryModel> categoryList = [];
    try {
      final dio = Dio();
      Response response =
          await dio.get(ApiBaseUrl.baseUrl + ApiEndPoints.categories);
      log('fg');
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        List data = response.data;
        categoryList = data.map((e) {
          log(e.toString());
          return HomeCategoryModel.fromJson(e);
        }).toList();
        return categoryList;
      } else {
        log("Error with status code ${response.statusCode.toString()}");
        return <HomeCategoryModel>[];
      }
    } catch (e) {
      log(e.toString());
      AppException.handleError(e, context);
    }
    return <HomeCategoryModel>[];
  }
}
