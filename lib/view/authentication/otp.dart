import 'package:e_commerce_app/controller/authentication/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/controller/authentication/otp_controller.dart';
import 'package:e_commerce_app/controller/authentication/sign_up_controller.dart';
import 'package:e_commerce_app/model/authentication/forgot_password/verify_forgot_password_model.dart';
import 'package:e_commerce_app/model/authentication/signup_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:otp_text_field/otp_field.dart';

import 'package:provider/provider.dart';

import '../../model/authentication/otp_enum_model.dart';
import '../widgets/submit_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.otpNumber, required this.type});
  final String? otpNumber;
  final ActionType type;
  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  late OtpController otp;
  late SignUpController signUp;
  late ForgetPasswordController forgotController;
  final OtpFieldController code = OtpFieldController();
  @override
  void initState() {
    otp = Provider.of<OtpController>(context, listen: false);
    forgotController =
        Provider.of<ForgetPasswordController>(context, listen: false);
    signUp = Provider.of<SignUpController>(context, listen: false);
    otp.changeTimer();
    super.initState();
  }

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
                        final verifyForgetModel = VerifyForgetModel(
                            email: forgotController.emailController.text,
                            otp: OtpController.code);
                        value.submitOtp(
                          context,
                          model,
                          widget.type,
                          verifyForgetModel,
                        );
                      },
                    );
            })
          ],
        ),
      ),
    );
  }
}
