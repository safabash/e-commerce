import 'package:e_commerce_app/helpers/constants.dart';

import 'package:flutter/material.dart';

import '../widgets/submit_button.dart';

class EditUserNameProfile extends StatelessWidget {
  const EditUserNameProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
          child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 225, 223, 223),
                label: Text('Full name')),
          ),
          boxheight20,
          Button(
            text: 'Save',
            onPressed: () {},
          )
        ],
      )),
    ));
  }
}
