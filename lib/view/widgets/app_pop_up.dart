import 'package:flutter/material.dart';

class AppPopUp {
  static String? showToast(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
    ));
  }
}
