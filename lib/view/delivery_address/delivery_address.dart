import 'package:e_commerce_app/view/constants.dart';
import 'package:e_commerce_app/view/delivery_address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
            title: AppbarTitle(
              title: 'Delivery Address',
            )),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    elevation: 5,
                    child: ListTile(
                      title: const Text(
                        'Safa Basheer\n',
                        style: TextStyle(fontFamily: 'Radley'),
                      ),
                      subtitle: Text(
                        "987654321\nkakkad(p.o),Malappuram\nKerala, Pin:676323",
                        style: fontStyle,
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.delete,
                            color: kcolor,
                          ),
                          Icon(
                            Icons.edit,
                            color: kcolor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Button(
                  text: 'Add Address',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddAddress()));
                  },
                )
              ],
            ),
          ),
        ));
  }
}
