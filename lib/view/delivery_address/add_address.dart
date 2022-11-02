import 'package:e_commerce_app/view/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar_title.dart';
import '../widgets/submit_button.dart';

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
              maxLines: 5,
              minLines: 3,
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
                  width: 180,
                  child: TextFormField(
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
                boxw10,
                SizedBox(
                  width: 180,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        fillColor: Color.fromARGB(255, 223, 220, 220),
                        filled: true,
                        label: Text('State'),
                        labelStyle: fontStyle),
                  ),
                )
              ],
            ),
            boxheight20,
            TextFormField(
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
              onPressed: (() {}),
            )
          ],
        ),
      ),
    );
  }
}
