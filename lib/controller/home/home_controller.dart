import 'dart:developer';
import 'package:e_commerce_app/model/home/home_category_model.dart';
import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:e_commerce_app/service/home/category_home_services.dart';
import 'package:flutter/material.dart';

import '../../model/authentication/product_model.dart';
import '../../service/home/product_home_service.dart';

class HomeController with ChangeNotifier {
  HomeController() {
    getAllProducts();
    getAllCategories();
  }
  List<HomeCategoryModel> categoryList = [];
  bool isLoading = false;
  void getAllCategories() async {
    log('start');
    isLoading = true;
    notifyListeners();
    categoryList = await HomeCategoriesService.getAllCategories();
    log('end');
    isLoading = false;
    notifyListeners();
  }

  Products? products;
  void getAllProducts() async {
    log('start');
    isLoading = true;
    notifyListeners();
    await HomeProductService().getAllProducts().then((value) {
      if (value != null) {
        products = value;
        isLoading = false;
        notifyListeners();
      }
    });
    log('end');
    isLoading = false;
    notifyListeners();
  }
}
