import 'package:e_commerce_app/controller/authentication/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/controller/authentication/forget_password/reset_password_controller.dart';
import 'package:e_commerce_app/controller/authentication/login_controller.dart';
import 'package:e_commerce_app/controller/authentication/otp_controller.dart';
import 'package:e_commerce_app/controller/authentication/sign_up_controller.dart';
import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:e_commerce_app/controller/payment/razor_pay_controller.dart';
import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:e_commerce_app/controller/splash/splash_provider.dart';
import 'package:e_commerce_app/controller/wishlist/wishlist_controller.dart';

import 'package:e_commerce_app/view/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/cart/cart_provider.dart';
import 'controller/drawer/drawer_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
        ChangeNotifierProvider<SignUpController>(
            create: (_) => SignUpController()),
        ChangeNotifierProvider<DrawerMenuController>(
            create: (_) => DrawerMenuController()),
        ChangeNotifierProvider<LogInController>(
            create: (_) => LogInController()),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
        ChangeNotifierProvider<OtpController>(create: (_) => OtpController()),
        ChangeNotifierProvider<ForgetPasswordController>(
            create: (_) => ForgetPasswordController()),
        ChangeNotifierProvider<ResetController>(
            create: (_) => ResetController()),
        ChangeNotifierProvider<HomeController>(create: (_) => HomeController()),
        ChangeNotifierProvider<SingleProductController>(
            create: (_) => SingleProductController()),
        ChangeNotifierProvider<PaymentOptionController>(
            create: (_) => PaymentOptionController()),
        ChangeNotifierProvider<ScreenWishlistProvider>(
            create: (_) => ScreenWishlistProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
