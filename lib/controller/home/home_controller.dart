import 'dart:developer';
import 'package:e_commerce_app/model/home/home_category_model.dart';
import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:e_commerce_app/service/home/category_home_services.dart';
import 'package:flutter/material.dart';

import '../../model/authentication/product_model.dart';

class HomeController with ChangeNotifier {
  List<HomeCategoryModel> categoryList = [];
  bool isLoading = false;
  void getAllCategories(context) async {
    log('start');
    isLoading = true;
    notifyListeners();
    categoryList = await HomeCategoriesService.getAllCategories(context);
    log('end');
    isLoading = false;
    notifyListeners();
  }

  List<ProductHome> productList = [
    ProductHome(
      name: "Casual Shirt",
      price: 400,
      image: "assets/home/download (1).jpg",
      description: "This is a good product",
      rating: "4.3",
      reviews: "1234",
      isFavorite: false,
      sizes: [30, 34, 36],
      colors: [
        Colors.green,
        Colors.white,
        Colors.blue,
      ],
      selectedColor: Colors.green,
      selectedSize: 30,
      quantity: 1,
    ),
    ProductHome(
      name: "Formal Shirt",
      price: 500,
      image: "assets/onboarding/f.png",
      description: "This is a good product",
      rating: "4.5",
      reviews: "4321",
      isFavorite: false,
      sizes: [34, 35, 38],
      colors: [
        Colors.green,
        Colors.white,
        Colors.blue,
      ],
      selectedSize: 35,
      selectedColor: Colors.green,
      quantity: 1,
    ),
  ];
}
