import 'package:e_commerce_app/controller/address/add_address_controller.dart';
import 'package:e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/appbar_title.dart';
import '../widgets/submit_button.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddressController>(context, listen: false);
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
            title: 'Add New Address',
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: provider.formKey,
            child: Column(
              children: [
                boxheight20,
                TextFormField(
                  validator: (value) => provider.nameValidator(
                      value, 'Please enter your fullname'),
                  controller: provider.nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Color.fromARGB(255, 223, 220, 220),
                      filled: true,
                      label: Text('Full name'),
                      labelStyle: fontStyle),
                ),
                boxheight20,
                TextFormField(
                  validator: (value) => provider.pincodeValidator(
                      value, 'Please enter correct pincode'),
                  controller: provider.pincodeController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Color.fromARGB(255, 223, 220, 220),
                      filled: true,
                      label: Text('Pincode'),
                      labelStyle: fontStyle),
                ),
                boxheight20,
                TextFormField(
                  validator: (value) => provider.addressValidator(
                      value, 'Please enter your address'),
                  controller: provider.addressController,
                  maxLines: 5,
                  minLines: 2,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Color.fromARGB(255, 223, 220, 220),
                      filled: true,
                      label: Text('Address'),
                      labelStyle: fontStyle),
                ),
                boxheight20,
                Row(
                  children: [
                    SizedBox(
                      width: 374,
                      child: TextFormField(
                        validator: (value) => provider.cityValidator(
                            value, 'Please enter your city'),
                        controller: provider.cityController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            fillColor: Color.fromARGB(255, 223, 220, 220),
                            filled: true,
                            label: Text('City'),
                            labelStyle: fontStyle),
                      ),
                    ),
                  ],
                ),
                boxheight20,
                TextFormField(
                  validator: (value) => provider.phoneValidator(
                      value, 'Please enter valid phone number'),
                  controller: provider.phoneController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      fillColor: Color.fromARGB(255, 223, 220, 220),
                      filled: true,
                      label: Text('Mobile'),
                      labelStyle: fontStyle),
                ),
                const SizedBox(height: 140),
                Button(
                  text: 'Save',
                  onPressed: (() {
                    provider.saveAddress(context, provider.formKey);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
