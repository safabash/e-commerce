import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({Key? key, required this.text}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontFamily: "Radley", fontSize: 30),
    );
  }
}

//appbar titles
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

//submit button
class Button extends StatelessWidget {
  Button({Key? key, required this.text, this.onPressed}) : super(key: key);
  String text;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
            20,
          )),
          backgroundColor: const Color.fromARGB(
              255, 234, 176, 30), // background (button) color
          foregroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontFamily: "Radley"),
        ),
      ),
    );
  }
}
