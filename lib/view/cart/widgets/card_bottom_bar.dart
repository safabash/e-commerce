import 'package:e_commerce_app/controller/cart/cart_provider.dart';
import 'package:e_commerce_app/helpers/constants.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/submit_button.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total :', style: titleStyleSingleProduct),
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
            Button(
              text: 'Check Out',
              onPressed: (() {
                context.read<CartProvider>().navigateToPayment(context);
              }),
            )
          ],
        ),
      ),
    );
  }
}
