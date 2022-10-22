import 'package:e_commerce_app/controller/splash_provider.dart';
import 'package:e_commerce_app/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/card_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider())
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
