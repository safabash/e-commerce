import 'package:e_commerce_app/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Lottie.asset('asset/lottie/forgetpassword.json'),
              TextFormField(),
              Button(
                text: 'Submit',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
