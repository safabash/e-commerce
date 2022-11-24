import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product}) : super(key: key);
  final ProductElement? product;
  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : InkWell(
            onTap: () {
              Provider.of<SingleProductController>(context, listen: false)
                  .getSingleProductDetails(product!.id!, context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Container(
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          product!.colors?[0].images[0] ??
                              "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0045_caa3443b-b45c-4ef9-93bd-7d8333515868_1200x.jpg?v=1663855549",
                          height: 200,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 150),
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
                        product!.name ?? "",
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Radley'),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.currency_rupee_outlined,
                            color: Colors.grey,
                            size: 17,
                          ),
                          Text(product!.price.toString(),
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.grey))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ));
  }
}
