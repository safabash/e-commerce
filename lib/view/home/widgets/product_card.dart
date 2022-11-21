import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../single_product_details.dart/single_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.list, required this.index})
      : super(key: key);
  final List<ProductElement> list;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SingleProduct()));
      },
      child: Consumer<HomeController>(
        builder: (context, value, child) {
          final product = value.products?.products[index];
          return value.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: Stack(
                        children: [
                          Image.network(
                              product?.colors?[0].images[0] ??
                                  "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0045_caa3443b-b45c-4ef9-93bd-7d8333515868_1200x.jpg?v=1663855549",
                              height: 200,
                              width: 150),
                          Padding(
                            padding: const EdgeInsets.only(left: 110),
                            child: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 229, 233, 235),
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
                          product?.name ?? "",
                          style: const TextStyle(
                              fontSize: 20, fontFamily: 'Radley'),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.currency_rupee_outlined,
                              color: Colors.grey,
                              size: 17,
                            ),
                            Text(product?.price.toString() ?? "",
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey))
                          ],
                        ),
                      ],
                    )
                  ],
                );
        },
      ),
    );
  }
}
