import 'package:e_commerce_app/view/constants.dart';
import 'package:e_commerce_app/view/home/home_page.dart';
import 'package:e_commerce_app/view/authentication/sign_up.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
            child: Column(
              children: [
                const SizedBox(
                  height: 85,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) =>
                      value != null ? 'Enter a valid mail' : null,
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
                  validator: (value) => value != null && value.length < 6
                      ? 'Enter minimum 6 characters'
                      : null,
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
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
                Button(
                  text: 'Log In',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
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
                    Text(
                      'Sign in with  ',
                      style: fontStyle,
                    ),
                    CircleAvatar(
                        radius: 15,
                        child: Image.asset('asset/images/google.png')),
                  ],
                ),
                SizedBox(height: height * .04),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
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
        ],
      ),
    );
  }
}
