import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/cart/cart_provider.dart';
import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/view/widgets/wishlist_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/submit_button.dart';
import 'widgets/color_dot.dart';
import 'widgets/size_button.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<SingleProductController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        provider.getSingleProductDetail(
          productId,
          context,
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: AddorRemoveFavoriteWidget(productId: productId))
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, SingleProductController value, child) {
            return value.isLoading
                ? Center(child: CircularProgressIndicator())
                : value.productElement == null
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Color.fromARGB(255, 195, 194, 194),
                            child: CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 280.0,
                                enlargeCenterPage: true,
                                onPageChanged: (position, reason) {},
                                enableInfiniteScroll: true,
                              ),
                              itemBuilder: (BuildContext context, int index,
                                  int realIndex) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(value
                                                .productElement!
                                                .colors![0]
                                                .images![index]
                                                .toString()),
                                            fit: BoxFit.cover)));
                              },
                              itemCount: value
                                  .productElement?.colors![0].images?.length,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        provider.productElement?.name ?? "",
                                        style: titleStyleSingleProduct,
                                      ),
                                      const SizedBox(width: 60),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.currency_rupee_outlined,
                                            size: 17,
                                          ),
                                          Text(
                                              provider.productElement!.price
                                                  .toString(),
                                              style:
                                                  const TextStyle(fontSize: 20))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      provider.productElement?.description ??
                                          "",
                                      style: const TextStyle(
                                          fontFamily: 'Radley', fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            boxheight20,
                                            const Text(
                                              'Colors',
                                              style: TextStyle(
                                                  fontFamily: 'Radley',
                                                  fontSize: 19),
                                            ),
                                            Consumer<SingleProductController>(
                                              builder: (context, value, child) {
                                                return Colordot();
                                              },
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sizes',
                                              style: TextStyle(
                                                  fontFamily: 'Radley',
                                                  fontSize: 19),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            SizeButton()
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                      child: Column(
                                    children: [
                                      Consumer<CartProvider>(
                                        builder: (context, value, child) {
                                          return Button(
                                            text: 'Add to Cart',
                                            onPressed: () {
                                              provider.goToCart(context);
                                              value.addProductsToCart(
                                                  provider.productElement!.id!,
                                                  provider.productElement!
                                                          .size![
                                                      provider.selectedSize],
                                                  provider.productElement!
                                                      .colors![0].color
                                                      .toString(),
                                                  context);
                                              value.getAllCartProducts(context);
                                            },
                                          );
                                        },
                                      ),
                                      boxheight20,
                                      Button(
                                        text: 'Check Out',
                                        onPressed: () {
                                          provider.goToPayment(context);
                                        },
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
