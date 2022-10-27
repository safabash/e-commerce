import 'package:e_commerce_app/view/constants.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

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
            title: 'Add New Address',
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  fillColor: const Color.fromARGB(255, 223, 220, 220),
                  filled: true,
                  label: const Text('Full name'),
                  labelStyle: fontStyle),
            ),
            boxheight20,
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  fillColor: const Color.fromARGB(255, 223, 220, 220),
                  filled: true,
                  label: const Text('Pincode'),
                  labelStyle: fontStyle),
            ),
            boxheight20,
            TextFormField(
              maxLines: 5,
              minLines: 3,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  fillColor: const Color.fromARGB(255, 223, 220, 220),
                  filled: true,
                  label: const Text('Address'),
                  labelStyle: fontStyle),
            ),
            boxheight20,
            Row(
              children: [
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        fillColor: const Color.fromARGB(255, 223, 220, 220),
                        filled: true,
                        label: const Text('City'),
                        labelStyle: fontStyle),
                  ),
                ),
                boxw10,
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        fillColor: const Color.fromARGB(255, 223, 220, 220),
                        filled: true,
                        label: const Text('State'),
                        labelStyle: fontStyle),
                  ),
                )
              ],
            ),
            boxheight20,
            TextFormField(
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  fillColor: const Color.fromARGB(255, 223, 220, 220),
                  filled: true,
                  label: const Text('Mobile'),
                  labelStyle: fontStyle),
            ),
            const SizedBox(height: 140),
            Button(
              text: 'Save',
              onPressed: (() {}),
            )
          ],
        ),
      ),
    );
  }
}
