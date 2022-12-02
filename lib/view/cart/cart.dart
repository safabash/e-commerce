import 'package:e_commerce_app/controller/cart/cart_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/appbar_title.dart';
import 'widgets/card_bottom_bar.dart';
import 'widgets/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppbarTitle(
            title: 'Cart',
          )),
      body: Consumer<CartProvider>(
        builder: (context, value, child) {
          if (value.cartProducts == null) {
            return const Center(child: Text('Cart is Empty'));
          } else if (value.isLoading == true) {
            return const CircularProgressIndicator();
          }
          return Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 200, 115),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: value.cartProducts?.products.length ?? 0,
                itemBuilder: ((context, index) {
                  final product = value.cartProducts?.products[index];
                  return Column(
                    children: [
                      CartItem(
                        price: product!.product.price.toString(),
                        title: product.product.name,
                        image: product.product.colors[0].images[0],
                        size: product.size,
                      ),
                    ],
                  );
                })),
          );
        },
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
