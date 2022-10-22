import 'package:e_commerce_app/view/constants.dart';
import 'package:e_commerce_app/view/home/home_page.dart';
import 'package:e_commerce_app/view/wishlist/favorites.dart';
import 'package:flutter/material.dart';

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
        children: const [
          CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('asset/images/winx.png'),
          ),
          boxheight10,
          Text(
            'Safa',
            style: TextStyle(
                fontFamily: 'Radley', fontSize: 18, color: Colors.white),
          ),
          boxheight10,
          Text(
            'safabasheer@gmail.com',
            style: TextStyle(
                fontFamily: 'Radley', fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Wrap(
      runSpacing: 16,
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
                MaterialPageRoute(builder: (context) => const Favorites()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          title: const Text('Orders', style: drawerTitlestyle),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Cart()));
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.location_on,
            color: Colors.white,
          ),
          title: const Text('Delivery Address', style: drawerTitlestyle),
          onTap: () {},
        ),
        const SizedBox(height: 80),
        const Center(
          child: Text(
            'v 1.00',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        )
      ],
    );
  }
}
