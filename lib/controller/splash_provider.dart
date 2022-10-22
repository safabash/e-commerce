import 'package:e_commerce_app/view/authentication/login.dart';
import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  Future<void> gotoLogin(context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => const LogIn()));
    notifyListeners();
  }
}
