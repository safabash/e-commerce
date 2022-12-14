import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/splash/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SplashProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await provider.gotoLogin(context);
    });

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset(
            'asset/images/Splash.png',
          ),
        ),
      ),
    );
  }
}
