import 'package:e_commerce_app/view/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search, color: kcolor),
            hintText: 'Search',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          ),
        )),
      ),
    );
  }
}
