import 'package:e_commerce_app/controller/home/home_controller.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/wishlist/wishlist_controller.dart';
import '../widgets/appbar_title.dart';
import '../widgets/wishlist_button.dart';

class CategoryProductView extends StatelessWidget {
  const CategoryProductView(
      {super.key, required this.title, required this.categoryId});
  final String title;
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        provider.getAllCategoryProducts(
          categoryId,
          context,
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: AppbarTitle(title: title),
      ),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          return value.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : value.categoryProducts == null
                  ? const Center(
                      child: SizedBox(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.categoryProducts!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.7,
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 7),
                          itemBuilder: ((context, index) {
                            final categoryProduct =
                                value.categoryProducts?[index];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                border: Border.all(),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                            categoryProduct
                                                    ?.colors?[0].images![0] ??
                                                "https://cdn.shopify.com/s/files/1/0752/6435/products/IMG_0045_caa3443b-b45c-4ef9-93bd-7d8333515868_1200x.jpg?v=1663855549",
                                            height: 200,
                                            width: 200,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                left: 140),
                                            child: Consumer<
                                                ScreenWishlistProvider>(
                                              builder: (context, value, child) {
                                                return AddorRemoveFavoriteWidget(
                                                  productId: categoryProduct!.id
                                                      .toString(),
                                                );
                                              },
                                            ))
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${categoryProduct?.name} ',
                                        style: const TextStyle(
                                            fontSize: 20, fontFamily: 'Radley'),
                                      ),
                                      Text(
                                          "₹${categoryProduct!.price.toString()}",
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.black))
                                    ],
                                  )
                                ],
                              ),
                            );
                          })),
                    );
        },
      ),
    );
  }
}
