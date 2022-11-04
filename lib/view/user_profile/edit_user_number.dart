import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../widgets/submit_button.dart';

class EditUserNumber extends StatelessWidget {
  const EditUserNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
          child: Column(
        children: [
          const TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 225, 223, 223),
                label: Text('Mobile number')),
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
