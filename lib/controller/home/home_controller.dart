import 'dart:developer';
import 'package:e_commerce_app/model/home/home_category_model.dart';
import 'package:e_commerce_app/service/home/category_home_services.dart';
import 'package:flutter/material.dart';

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
}
