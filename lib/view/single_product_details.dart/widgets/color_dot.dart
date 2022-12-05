import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Colordot extends StatelessWidget {
  const Colordot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = context.read<SingleProductController>().productElement;
    return Consumer<SingleProductController>(
      builder: (context, value, child) {
        return SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: product?.colors?.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (() {
                  value.setColor(index);
                }),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: value.selectedColor == index
                              ? Colors.black
                              : Colors.transparent),
                      shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child:
                        CircleAvatar(radius: 10, backgroundColor: Colors.black),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
