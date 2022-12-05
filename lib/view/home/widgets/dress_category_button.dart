import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DressButtonWidget extends StatelessWidget {
  const DressButtonWidget(
      {Key? key, required this.image, required this.text, required this.index})
      : super(key: key);
  final String image;
  final String text;
  final int index;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          provider.navigateToCategoryProducts(
              context, text, provider.categoryList[index].id.toString());
        },
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
      ),
    );
  }
}
