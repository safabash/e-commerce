import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';

import 'package:e_commerce_app/view/search/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../drawer/navigation_drawer.dart';

import '../widgets/appbar_title.dart';

import 'widgets/dress_category_button.dart';
import 'widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<HomeController>(
                  builder: (context, value, child) {
                    return value.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            height: 80,
                            child: ListView.builder(
                                itemCount: value.categoryList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) {
                                  return DressButtonWidget(
                                      index: index,
                                      image: value.categoryList[index].icon
                                          .toString(),
                                      text: value.categoryList[index].category
                                          .toString());
                                })),
                          );
                  },
                ),
                const SizedBox(height: 20),
                Consumer<HomeController>(builder: (context, value, child) {
                  return value.isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.products == null
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: value.products!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 0.7,
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 7),
                              itemBuilder: ((context, index) => ProductCard(
                                    product: value.products,
                                    index: index,
                                  )));
                })
              ],
            ),
          ),
        )),
      ),
    );
  }
}
