import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeButton extends StatelessWidget {
  SizeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SingleProductController>(
      builder: (context, value, child) {
        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: value.productElement!.size!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  value.setSize(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: value.selectedSize == index
                                ? Colors.black
                                : Colors.transparent),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 8,
                              spreadRadius: 2)
                        ]),
                    child: Center(
                      child: Text(
                        value.productElement!.size![index],
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
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
