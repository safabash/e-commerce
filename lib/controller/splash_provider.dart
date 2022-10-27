import 'dart:developer';

import 'package:e_commerce_app/view/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashProvider with ChangeNotifier {
  Future<void> gotoLogin(context) async {
    await Future.delayed(const Duration(seconds: 3));
    const storage = FlutterSecureStorage();

    final token = await storage.read(key: 'token');
    log(token.toString());
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LogIn()));
  }
}
