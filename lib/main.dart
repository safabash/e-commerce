import 'package:e_commerce_app/controller/authentication/login_controller.dart';
import 'package:e_commerce_app/controller/authentication/otp_controller.dart';
import 'package:e_commerce_app/controller/authentication/sign_up_controller.dart';
import 'package:e_commerce_app/controller/splash_provider.dart';
import 'package:e_commerce_app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/card_provider.dart';
import 'controller/drawer/drawer_controller.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<SignUpController>(create: (_) => SignUpController()),
    ChangeNotifierProvider<DrawerMenuController>(
        create: (_) => DrawerMenuController()),
    ChangeNotifierProvider<LogInController>(create: (_) => LogInController()),
    ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ChangeNotifierProvider<OtpController>(create: (_) => OtpController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
