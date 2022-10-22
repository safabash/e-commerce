import 'package:flutter/material.dart';

class DressButtonWidget extends StatelessWidget {
  DressButtonWidget({Key? key, required this.image, required this.text})
      : super(key: key);
  String image;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
          onPressed: (() {}),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 30,
                  width: 30,
                ),
                Text(text,
                    style: const TextStyle(
                        fontFamily: 'Radley', color: Colors.black)),
              ],
            ),
          )),
    );
  }
}
