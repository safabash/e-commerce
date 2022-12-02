import 'package:e_commerce_app/controller/cart/cart_provider.dart';
import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/view/delivery_address/delivery_address.dart';
import 'package:e_commerce_app/view/home/home_page.dart';
import 'package:e_commerce_app/view/user_profile/user_profile.dart';
import 'package:e_commerce_app/view/wishlist/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/drawer/drawer_controller.dart';
import '../cart/cart.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kcolor,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [buildHeader(context), buildMenuItems(context)],
      )),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserProfile()));
            },
            child: const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('asset/images/winx.png'),
            ),
          ),
          boxheight10,
          const Text(
            'Safa',
            style: TextStyle(
                fontFamily: 'Radley', fontSize: 18, color: Colors.white),
          ),
          boxheight10,
          const Text(
            'safabasheer@gmail.com',
            style: TextStyle(
                fontFamily: 'Radley', fontSize: 18, color: Colors.white),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 5,
      children: [
        ListTile(
          leading: const Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          title: const Text('Home', style: drawerTitlestyle),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.favorite_border_outlined,
            color: Colors.white,
          ),
          title: const Text('WishList', style: drawerTitlestyle),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WishList()));
          },
        ),
        Consumer<CartProvider>(
          builder: (context, value, child) {
            return ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              title: const Text('Cart', style: drawerTitlestyle),
              onTap: () {
                value.getAllCartProducts(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          title: const Text('Delivery Address', style: drawerTitlestyle),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DeliveryAddress()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          title: const Text('Log Out', style: drawerTitlestyle),
          onTap: () {
            Provider.of<DrawerMenuController>(context, listen: false)
                .logOut(context);
          },
        ),
        const SizedBox(height: 150),
        const Center(
          child: Text(
            'v 1.00',
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        )
      ],
    );
  }
}
