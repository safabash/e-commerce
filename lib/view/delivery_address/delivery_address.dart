import 'package:e_commerce_app/helpers/constants.dart';
import 'package:e_commerce_app/view/delivery_address/add_address.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/address/add_address_controller.dart';
import '../widgets/appbar_title.dart';
import '../widgets/submit_button.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressController>(context, listen: false);

    provider.getAddressFn(context);

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
          child: ListView(
            children: [
              Consumer<AddressController>(
                builder: (context, value, child) {
                  return value.address.isEmpty
                      ? const Center(child: Text('No Address Saved'))
                      : ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.address.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: const EdgeInsets.all(10),
                              elevation: 5,
                              child: ListTile(
                                leading: Radio(
                                    activeColor: kcolor,
                                    value: index,
                                    groupValue: value.selectedType, //
                                    onChanged: ((newValue) {
                                      value.radionButtonChange(newValue!);
                                    })),
                                title: Text(
                                  "${value.address[index].name}",
                                  style: const TextStyle(
                                      fontFamily: 'Radley', fontSize: 21),
                                ),
                                subtitle: Text(
                                  "Phone: ${value.address[index].phone}\nAddress: ${value.address[index].address}\n City: ${value.address[index].city},\n Pin:${value.address[index].pincode}",
                                  style: fontStyle,
                                ),
                                trailing: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        value.showDeleteAlert(
                                            context, value.address[index].id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: kcolor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
              const SizedBox(height: 40),
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
      ),
    );
  }
}
