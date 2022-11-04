import 'package:e_commerce_app/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: TextField(
          decoration: InputDecoration(
            icon: const Icon(Icons.search, color: kcolor),
            hintText: 'Search',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        )),
      ),
    );
  }
}
