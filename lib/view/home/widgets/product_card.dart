import 'package:e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';

import '../../single_product_details.dart/single_product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SingleProduct()));
      },
      child: Column(
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Stack(
              children: [
                Image.asset('asset/images/alldress.jpeg',
                    height: 200, width: 150),
                Padding(
                  padding: const EdgeInsets.only(left: 110),
                  child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 229, 233, 235),
                      child: IconButton(
                          onPressed: (() {}),
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))),
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Black dress',
                style: TextStyle(fontSize: 20, fontFamily: 'Radley'),
              ),
              Row(
                children: const [
                  Icon(
                    Icons.currency_rupee_outlined,
                    color: Colors.grey,
                    size: 17,
                  ),
                  Text('500',
                      style: TextStyle(fontSize: 17, color: Colors.grey))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
