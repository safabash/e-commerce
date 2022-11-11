import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import '../widgets/submit_button.dart';
import 'widgets/payment_status_text.dart';

class FailedPayment extends StatelessWidget {
  const FailedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: [
            PaymentStatusText(
              text: 'Payment Failed',
            ),
            const SizedBox(height: 90),
            Lottie.asset('asset/lottie/failed.json'),
            const SizedBox(height: 140),
            Button(
              text: 'Go Back',
              onPressed: (() {}),
            )
          ],
        ),
      ),
    )));
  }
}
