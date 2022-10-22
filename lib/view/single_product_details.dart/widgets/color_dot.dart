import 'package:flutter/material.dart';

class Colordot extends StatelessWidget {
  Colordot({
    Key? key,
    required this.color,
    required this.isActive,
    required this.press,
  }) : super(key: key);
  final Color color;
  bool isActive = true;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            border:
                Border.all(color: isActive ? Colors.black : Colors.transparent),
            shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 10,
            backgroundColor: color,
          ),
        ),
      ),
    );
  }
}
