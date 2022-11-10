import 'package:flutter/material.dart';

import '../../../helpers/constants.dart';

class PaymentStatusText extends StatelessWidget {
  PaymentStatusText({Key? key, this.text}) : super(key: key);
  String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
          fontFamily: 'Radley',
          color: kcolor,
          fontSize: 40,
          fontWeight: FontWeight.bold),
    );
  }
}
