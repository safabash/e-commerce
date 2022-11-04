import 'dart:developer';

import 'package:e_commerce_app/controller/authentication/forget_password/forget_password_controller.dart';
import 'package:e_commerce_app/controller/authentication/forget_password/reset_password_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/model/authentication/forgot_password/reset_password_model.dart';
import 'package:e_commerce_app/view/widgets/submit_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResetController>(context, listen: false);
    final forgotProvider =
        Provider.of<ForgetPasswordController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcolor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                validator: (value) => provider.passwordValidator(value),
                controller: provider.passwordController,
                obscureText: provider.isObscure,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: (() {
                          context.read<ResetController>().obscure();
                        }),
                        icon: Icon(context.watch<ResetController>().isObscure
                            ? Icons.visibility_off
                            : Icons.visibility))),
              ),
              const SizedBox(height: 40),
              Button(
                text: 'Reset Password',
                onPressed: () async {
                  log(forgotProvider.emailController.text);
                  log(provider.passwordController.text);
                  ResetPasswordModel model = ResetPasswordModel(
                      email: forgotProvider.emailController.text,
                      password: provider.passwordController.text);
                  await provider.resetPassword(model, context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
