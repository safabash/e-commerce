import 'package:e_commerce_app/controller/authentication/sign_up_controller.dart';
import 'package:e_commerce_app/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignUpController>(context, listen: false);
    provider.disposeField();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(child: TitleText(text: 'Create account')),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: provider.nameController,
                validator: (value) =>
                    provider.nameValidator(value, 'Please enter your fullname'),
                decoration: InputDecoration(
                    labelText: 'Full name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: provider.emailController,
                validator: (value) => provider.isValidEmail(value)
                    ? null
                    : 'Please enter valid mail id',
                decoration: InputDecoration(
                    labelText: 'email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: provider.phoneController,
                validator: (value) => provider.phoneValidator(
                    value, 'Please enter valid phone number'),
                decoration: InputDecoration(
                    labelText: 'phone',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                    fillColor: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: provider.passwordController,
                validator: (value) => provider.passwordValidator(
                    value, 'Please enter 6 digit characters'),
                decoration: InputDecoration(
                  labelText: 'password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: provider.confirmPasswordController,
                validator: (value) => provider.confirmPasswordValidator(
                    value, "Passwords does'nt match"),
                decoration: InputDecoration(
                  labelText: 'Confirm password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<SignUpController>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.isLoading
                      ? const CircularProgressIndicator()
                      : Button(
                          text: 'Create Account',
                          onPressed: () {
                            provider.registerUser(context, formKey);
                          },
                        );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?  ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogIn()));
                    },
                    child: const Text(
                      'Log In',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Radley",
                          color: Color.fromARGB(255, 234, 176, 30),
                          fontSize: 17),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
