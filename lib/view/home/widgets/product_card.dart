import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:flutter/material.dart';

import '../../single_product_details.dart/single_product.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key, required this.list, required this.index})
      : super(key: key);
  final List<ProductHome> list;
  int index;
  @override
  Widget build(BuildContext context) {
    final ProductHome product = list[index];
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SingleProduct()));
      },
      child: Column(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Image.asset('asset/images/alldress.jpeg',
                    height: 200, width: 150),
                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 229, 233, 235),
                      child: IconButton(
                          onPressed: (() {}),
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontSize: 20, fontFamily: 'Radley'),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.currency_rupee_outlined,
                    color: Colors.grey,
                    size: 17,
                  ),
                  Text(product.price.toString(),
                      style: const TextStyle(fontSize: 17, color: Colors.grey))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
