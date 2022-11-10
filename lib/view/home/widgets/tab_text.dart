import 'package:flutter/material.dart';

class TabText extends StatelessWidget {
  const TabText({Key? key, this.text}) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Radley',
        fontSize: 17,
      ),
    );
  }
}
