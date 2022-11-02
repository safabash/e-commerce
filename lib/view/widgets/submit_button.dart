import 'package:flutter/material.dart';

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
