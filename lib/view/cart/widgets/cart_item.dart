import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/cart/cart_provider.dart';
import '../../../helpers/constants.dart';

class CartItem extends StatelessWidget {
  CartItem({super.key, this.title, this.price, this.image, this.size});
  String? title;
  String? size;
  String? image;
  String? price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 90,
            width: 90,
            child: Image.network(image!),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: titleStyleSingleProduct,
                ),
                Text(
                  size ?? '',
                  style: fontStyle,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.currency_rupee_outlined,
                      size: 15,
                    ),
                    Text(price!, style: const TextStyle(fontSize: 15))
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
              Consumer<CartProvider>(
                builder: (context, value, child) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          value.itemCountDecrease();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10)
                              ]),
                          child: const Icon(
                            CupertinoIcons.minus,
                            size: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(4),
                        child: Text(
                          value.itemcount.toString(),
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          value.itemCountIncrease();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10)
                              ]),
                          child: const Icon(
                            CupertinoIcons.plus,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
