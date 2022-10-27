import 'package:e_commerce_app/view/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DrawerMenuController with ChangeNotifier {
  void logOut(context) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: 'token', value: null);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const LogIn();
      },
    ), (route) => false);
  }
}
