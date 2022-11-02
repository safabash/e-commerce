import 'dart:io';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/view/widgets/app_pop_up.dart';

class AppException {
  static void handleError(Object exception, context) {
    if (exception == SocketException) {
      AppPopUp.showToast(context, "Please check your internet");
    } else if (exception is DioError) {
      // if (exception.response['message'] != null) {
      //   AppPopUp.showToast(context, exception.response?.data['message']);
      // }

      //else
      if (exception.type == DioErrorType.cancel) {
        AppPopUp.showToast(context, "Request Cancelled");
      } else if (exception.type == DioErrorType.connectTimeout) {
        AppPopUp.showToast(context, "Connection timeout");
      } else if (exception.type == DioErrorType.receiveTimeout) {
        AppPopUp.showToast(context, "Receive timeout");
      } else if (exception.type == DioErrorType.sendTimeout) {
        AppPopUp.showToast(context, "Send time out");
      } else if (exception.type == DioErrorType.other) {
        AppPopUp.showToast(context, "Error Occured");
      } else if (exception.type == DioErrorType.response) {
        AppPopUp.showToast(context, "Error Occured with no response");
      }
    } else {
      AppPopUp.showToast(context, exception.toString());
    }
  }
}
