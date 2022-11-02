import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  AppbarTitle({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontFamily: 'Radley', fontSize: 20, color: Colors.black),
    );
  }
}
