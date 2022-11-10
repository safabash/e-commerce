import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/controller/single_product_controller/single_product_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/submit_button.dart';
import 'widgets/color_dot.dart';
import 'widgets/size_button.dart';

class SingleProduct extends StatelessWidget {
  const SingleProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<SingleProductController>(context, listen: false);
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
          CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 229, 233, 235),
              child: IconButton(
                  onPressed: (() {}),
                  icon: const Icon(
                    Icons.favorite,
                    color: kcolor,
                  )))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image.asset('asset/images/alldress.jpeg'),
          CarouselSlider(
            options: CarouselOptions(
              height: 280.0,
              enlargeCenterPage: true,
              onPageChanged: (position, reason) {},
              enableInfiniteScroll: false,
            ),
            items: images.map<Widget>((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(i), fit: BoxFit.cover)));
                },
              );
            }).toList(),
          ),

          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 234, 232, 232),
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
                    children: [
                      const Text(
                        'Formal Black Dress',
                        style: titleStyleSingleProduct,
                      ),
                      const SizedBox(width: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.currency_rupee_outlined,
                            size: 17,
                          ),
                          Text('500', style: TextStyle(fontSize: 17))
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non laoreet lacus. Sed vitae ligula eu tortor condimentum viverra. Curabitur quis enim nulla. Pellentesque vitae leo augue. Duis in fringilla augue. Mauris id mauris auctor.',
                    style: TextStyle(fontFamily: 'Radley', fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Colors',
                            style:
                                TextStyle(fontFamily: 'Radley', fontSize: 19),
                          ),
                          boxheight10,
                          Row(
                            children: [
                              Colordot(
                                color: Colors.black,
                                isActive: true,
                                press: () {},
                              ),
                              Colordot(
                                color: Colors.amber,
                                isActive: false,
                                press: () {},
                              ),
                              Colordot(
                                color: Colors.pink,
                                isActive: false,
                                press: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text(
                            'Sizes',
                            style:
                                TextStyle(fontFamily: 'Radley', fontSize: 19),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizeButton(size: 'S'),
                              boxw10,
                              SizeButton(size: 'M'),
                              boxw10,
                              SizeButton(size: 'L'),
                              boxw10,
                              SizeButton(size: 'XL'),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Center(
                      child: Column(
                    children: [
                      Button(
                        text: 'Add to Cart',
                        onPressed: () {
                          provider.goToCart(context);
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
          ))
        ],
      ),
    );
  }
}
