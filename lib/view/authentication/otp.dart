import 'package:e_commerce_app/controller/authentication/otp_controller.dart';
import 'package:e_commerce_app/controller/authentication/sign_up_controller.dart';
import 'package:e_commerce_app/model/authentication/signup_model.dart';
import 'package:e_commerce_app/view/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:otp_text_field/otp_field.dart';

import 'package:provider/provider.dart';

import '../widgets/submit_button.dart';

class OtpPage extends StatefulWidget {
  OtpPage({super.key, required this.otpNumber});
  String? otpNumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late OtpController otp;
  late SignUpController signUp;
  final OtpFieldController code = OtpFieldController();
  @override
  void initState() {
    otp = Provider.of<OtpController>(context, listen: false);
    signUp = Provider.of<SignUpController>(context, listen: false);
    otp.changeTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                autoFocus: true,
                borderColor: Colors.black,
                disabledBorderColor: Colors.black,
                enabledBorderColor: Colors.black,
                cursorColor: Colors.black,
                focusedBorderColor: Colors.black,
                borderWidth: 1.5,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                fieldWidth: 60.0,
                onSubmit: (String code) {
                  otp.setCode(code);
                },
              ),
            ),
            const SizedBox(height: 40),
            Consumer<OtpController>(builder: (context, value, child) {
              return value.isLoading
                  ? const CircularProgressIndicator()
                  : Button(
                      text: 'Verify',
                      onPressed: () {
                        final model = SignUpUserModel(
                            email: signUp.emailController.text,
                            username: signUp.nameController.text,
                            password: signUp.passwordController.text,
                            phone: signUp.phoneController.text);
                        value.submitOtp(context, model);
                      },
                    );
            })
          ],
        ),
      ),
    );
  }
}
