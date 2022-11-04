import 'package:flutter/material.dart';

class AppPopUp {
  static String? showToast(context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      backgroundColor: color,
    ));
  }
}
