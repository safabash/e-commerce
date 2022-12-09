import 'package:e_commerce_app/controller/wishlist/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/widgets/cart_item.dart';
import '../widgets/appbar_title.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController =
        Provider.of<ScreenWishlistProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      wishlistController.getAllWishlistProducts(context);
    });
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: AppbarTitle(
            title: 'Wishlist',
          )),
      body: Consumer<ScreenWishlistProvider>(
        builder: (context, value, child) {
          if (value.wishListProductElement.isEmpty) {
            return const Center(child: Text('Wishlist is Empty'));
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
                itemCount: value.wishListProductElement.length,
                itemBuilder: ((context, index) {
                  final product = value.wishListProductElement[index];
                  return Column(
                    children: [
                      CartItem(
                        id: product.id.toString(),
                        price: product.price.toString(),
                        title: product.name,
                        image: product.colors![0].images![0],
                      ),
                    ],
                  );
                })),
          );
        },
      ),
      // bottomNavigationBar: const CartBottomBar(),
    );
  }
}
