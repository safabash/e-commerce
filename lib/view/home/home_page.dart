import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/home/home_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/view/home/widgets/tab_text.dart';
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
    WidgetsBinding.instance
        .addPostFrameCallback((_) => provider.getAllCategories(context));

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
          // bottom: const TabBar(tabs: [
          //   Tab(
          //     child: TabText(
          //       text: 'All',
          //     ),
          //   ),
          //   Tab(
          //     child: TabText(text: 'Women'),
          //   ),
          //   Tab(
          //     child: TabText(text: 'Men'),
          //   )
          // ]),
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
                                      image: value.categoryList[index].image,
                                      text: value.categoryList[index].name);
                                })),
                          );
                  },
                ),
                const SizedBox(height: 20),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(pagesBanner[index]),
                                fit: BoxFit.fill)));
                  },
                  itemCount: 3,
                ),
                const SizedBox(height: 20),
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0),
                    itemBuilder: ((context, index) => const ProductCard()))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
