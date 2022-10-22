import 'package:flutter/material.dart';
import '../cart/widgets/card_bottom_bar.dart';
import '../cart/widgets/cart_item.dart';
import '../widgets.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppbarTitle(
            title: 'Wish List',
          )),
      body: ListView(
        children: [
          Container(
            height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 237, 235, 235),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Column(
              children: const [
                CartItem(),
                CartItem(),
                CartItem(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: const CartBottomBar(),
    );
  }
}
