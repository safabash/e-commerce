import 'package:e_commerce_app/view/search/search.dart';
import 'package:flutter/material.dart';

import '../drawer/navigation_drawer.dart';
import '../widgets.dart';
import 'widgets/dress_category_button.dart';
import 'widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppbarTitle(title: 'Winx'),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Search()));
                  }),
                  icon: const Icon(Icons.search, color: Colors.black)),
            ],
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                DressButtonWidget(
                    image: 'asset/images/alldress.jpeg', text: 'All'),
                DressButtonWidget(
                    image: 'asset/images/femaledress.jpeg', text: 'Women'),
                DressButtonWidget(
                    image: 'asset/images/maledress.jpeg', text: 'Men'),
                DressButtonWidget(
                    image: 'asset/images/kiddress.jpeg', text: 'Kids'),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0),
                    itemBuilder: ((context, index) => const ProductCard())))
          ],
        ),
      )),
    );
  }
}
