import 'package:e_commerce_app/view/constants.dart';
import 'package:e_commerce_app/view/user_profile/edit_user_name_profile.dart';
import 'package:e_commerce_app/view/user_profile/edit_user_number.dart';

import 'package:flutter/material.dart';

import '../widgets/appbar_title.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: AppbarTitle(
            title: 'Profile',
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 100,
                  ),
                  // ignore: prefer_const_constructors
                  Icon(Icons.photo_camera, size: 45, color: kcolor)
                ],
              ),
              boxheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("safa",
                      style: TextStyle(fontFamily: 'Radley', fontSize: 20)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const EditUserNameProfile()));
                      },
                      icon: const Icon(Icons.navigate_next))
                ],
              ),
              boxheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "987654321",
                    style: TextStyle(fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditUserNumber()));
                      },
                      icon: const Icon(Icons.navigate_next))
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
