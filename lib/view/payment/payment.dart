import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/controller/payment/razor_pay_controller.dart';
import 'package:e_commerce_app/service/payment/payment_service.dart';
import 'package:e_commerce_app/view/payment/failed_payment.dart';

import 'package:e_commerce_app/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../widgets/appbar_title.dart';

class PaymentOption extends StatefulWidget {
  const PaymentOption({super.key});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

late PaymentOptionController paymentOptionController;

class _PaymentOptionState extends State<PaymentOption> {
  @override
  void initState() {
    paymentOptionController =
        Provider.of<PaymentOptionController>(context, listen: false);

    paymentOptionController.razorPayInitFn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppbarTitle(
            title: 'Payment Options',
          )),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Choose payment method',
              style: titleStyleSingleProduct,
            ),
            const SizedBox(height: 30),
            Consumer<PaymentOptionController>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    ListTile(
                      leading: Radio(
                          activeColor: kcolor,
                          value: 'online',
                          groupValue: value.selectedType,
                          onChanged: ((newValue) {
                            value.radionButtonChange(newValue.toString());
                          })),
                      title: const Text(
                        'online',
                        style: TextStyle(
                            fontFamily: 'Radley', fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.payment_outlined,
                        color: kcolor,
                      ),
                    ),
                    boxheight20,
                    ListTile(
                      leading: Radio(
                          activeColor: kcolor,
                          value: 'cod',
                          groupValue: value.selectedType, //
                          onChanged: ((newValue) {
                            value.radionButtonChange(newValue.toString());
                          })),
                      title: const Text(
                        'cod',
                        style: TextStyle(
                            fontFamily: 'Radley', fontWeight: FontWeight.bold),
                      ),
                      trailing: const Icon(
                        Icons.payment_outlined,
                        color: kcolor,
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Button(
                text: 'Pay',
                onPressed: () {
                  paymentOptionController.goToPayment();
                },
              ),
            )
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    paymentOptionController.razorpay.clear();
    super.dispose();
  }
}
