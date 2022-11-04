import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_base_url.dart';
import 'package:e_commerce_app/core/api/api_end_points.dart';
import 'package:e_commerce_app/utils/exceptions/api_exceptions.dart';

class ForgetPasswordService {
  static Future<String?> getOtpPassword(String email, context) async {
    final dio = Dio();
    try {
      final response = await dio.post(
          ApiBaseUrl.baseUrl + ApiEndPoints.password,
          data: {"email": email});
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return response.data["message"];
      }
    } catch (e) {
      AppException.handleError(e, context);
    }
    return null;
  }
}
