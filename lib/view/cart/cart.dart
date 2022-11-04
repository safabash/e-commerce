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
          return value.cartList.isEmpty
              ? Text('Cart is Empty')
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: value.cartList.length,
                  itemBuilder: ((context, index) {
                    final product = value.cartList[index];
                    return Container(
                      height: 700,
                      padding: const EdgeInsets.only(top: 15),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 237, 235, 235),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                      child: Column(
                        children: [
                          CartItem(
                              price: product.price,
                              title: product.image,
                              image: product.image),
                        ],
                      ),
                    );
                  }));
        },
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
