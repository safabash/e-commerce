import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:e_commerce_app/controller/wishlist/wishlist_controller.dart';

import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:e_commerce_app/view/widgets/wishlist_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.index})
      : super(key: key);
  final List<Products>? product;
  final int index;
  @override
  Widget build(BuildContext context) {
    return product == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : InkWell(
            onTap: () {
              Provider.of<SingleProductController>(context, listen: false)
                  .navigateToProductDetails(
                      context, index, product![index].id!);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(
                    // color: Color.fromARGB(255, 213, 213, 213),
                    ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                          child: Image.network(
                            product![index].colors?[0].images![0] ??
                                "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0045_caa3443b-b45c-4ef9-93bd-7d8333515868_1200x.jpg?v=1663855549",
                            height: 200,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 140),
                            child: Consumer<ScreenWishlistProvider>(
                              builder: (context, value, child) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.only(right: 10, top: 10),
                                  child: AddorRemoveFavoriteWidget(
                                    productId: product![index].id.toString(),
                                  ),
                                );
                              },
                            ))
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${product![index].name} ',
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Radley'),
                      ),
                      Text("₹${product![index].price.toString()}",
                          style:
                              const TextStyle(fontSize: 17, color: Colors.grey))
                    ],
                  )
                ],
              ),
            ));
  }
}
