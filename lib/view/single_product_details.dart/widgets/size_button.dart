import 'package:flutter/material.dart';

class SizeButton extends StatelessWidget {
  SizeButton({Key? key, required this.size}) : super(key: key);
  String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 8, spreadRadius: 2)
          ]),
      child: Center(
        child: Text(
          size,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
