import 'package:e_commerce_app/view/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawerMenuController with ChangeNotifier {
  void logOut(context) async {
    const storage = FlutterSecureStorage();
    GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    await storage.write(key: 'token', value: null);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return LogIn();
      },
    ), (route) => false);
  }
}
