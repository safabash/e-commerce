import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/model/address/address_get_model.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AddressGetService {
  static Future<List<AddressGetModel>?> getAddress(BuildContext context) async {
    final dio = Dio();
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    try {
      final response = await dio.get(ApiBaseUrl.baseUrl + ApiEndPoints.address,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log(response.data.toString());
        List<AddressGetModel> address = (response.data as List)
            .map((e) => AddressGetModel.fromJson(e))
            .toList();

        return address;
      }
    } catch (e) {
      log('address get error');
      AppException.handleError(e, context);
    }
    return null;
  }
}
