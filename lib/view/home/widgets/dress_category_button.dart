import 'package:flutter/material.dart';

class DressButtonWidget extends StatelessWidget {
  const DressButtonWidget({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 49,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(
                image,
                height: 30,
                width: 30,
              ),
              Text(text,
                  style: const TextStyle(
                      fontFamily: 'Radley', color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
