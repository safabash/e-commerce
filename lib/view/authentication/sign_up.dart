import 'package:e_commerce_app/view/widgets.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(child: TitleText(text: 'Create account')),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
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
              decoration: InputDecoration(
                labelText: 'password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Confirm password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Button(
              text: 'Create Account',
              onPressed: () {},
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
      )),
    );
  }
}
