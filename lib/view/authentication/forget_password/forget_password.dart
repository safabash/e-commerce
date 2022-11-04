import 'package:e_commerce_app/controller/authentication/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ForgetPasswordController>(context, listen: false);
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
            children: [
              Lottie.asset('asset/lottie/forgetpassword.json'),
              Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                        decoration: const InputDecoration(hintText: "e-mail"),
                        controller: provider.emailController,
                        validator: (value) => provider.isValidEmail(value)
                            ? null
                            : 'Please Enter valid email'),
                  )),
              boxheight20,
              Button(
                text: 'Submit',
                onPressed: () {
                  provider.goToOtp(formkey, context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
