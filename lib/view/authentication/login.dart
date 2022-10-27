import 'package:e_commerce_app/controller/authentication/login_controller.dart';
import 'package:e_commerce_app/view/constants.dart';
import 'package:e_commerce_app/view/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<LogInController>(context, listen: false);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              height: height / 4,
              width: width,
              child: FittedBox(
                fit: BoxFit.cover,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(130)),
                  child: Image.asset(
                    'asset/images/winx.png',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 85,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: provider.emailController,
                    validator: (value) =>
                        provider.nameValidator(value, 'Enter email id'),
                    decoration: InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        fillColor: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<LogInController>(
                    builder: (context, value, child) {
                      return TextFormField(
                        obscureText: provider.passwordVisible,
                        keyboardType: TextInputType.text,
                        controller: provider.passwordController,
                        validator: (value) => provider.passwordValidator(
                            value, 'enter the password'),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: Icon(provider.passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: provider.passwordVisibility),
                          labelText: 'password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      );
                    },
                  ),
                  boxheight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'forgot password?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: "Radley",
                            color: Color.fromARGB(255, 234, 176, 30),
                            fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Consumer<LogInController>(
                    builder: (context, value, child) {
                      return value.isLoading == true
                          ? const CircularProgressIndicator()
                          : Button(
                              text: 'Log In',
                              onPressed: () async {
                                await value.signIn(context, formKey);
                              },
                            );
                    },
                  ),
                  SizedBox(
                    height: height * .017,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 40,
                        width: (width / 2) - 40,
                        child: const Divider(),
                      ),
                      const Text(
                        'Or',
                        style:
                            TextStyle(color: Colors.grey, fontFamily: 'Radley'),
                      ),
                      SizedBox(
                        width: (width / 2) - 40,
                        child: const Divider(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .016,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 15,
                          child: Image.asset('asset/images/google.png')),
                    ],
                  ),
                  SizedBox(height: height * .04),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: const Text(
                      'Create Account',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "Radley",
                          color: Color.fromARGB(255, 234, 176, 30),
                          fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
