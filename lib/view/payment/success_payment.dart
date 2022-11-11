import 'package:e_commerce_app/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'widgets/payment_status_text.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          PaymentStatusText(
            text: 'Payment Successfull',
          ),
          Lottie.asset('asset/lottie/sucess.json'),
          const SizedBox(height: 140),
          Button(
            text: 'Go Back',
            onPressed: (() {}),
          )
        ],
      ),
    )));
  }
}
