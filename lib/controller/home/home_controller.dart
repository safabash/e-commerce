import 'dart:developer';

import 'package:e_commerce_app/model/carousal/carousal_get_model.dart';
import 'package:e_commerce_app/model/category/category_product_model.dart';
import 'package:e_commerce_app/model/home/home_category_model.dart';
import 'package:e_commerce_app/model/home/home_product_model.dart';
import 'package:e_commerce_app/service/carousal/carousal_get_service.dart';
import 'package:e_commerce_app/service/category/category_products_service.dart';
import 'package:e_commerce_app/service/home/category_home_services.dart';
import 'package:e_commerce_app/view/category/category_product_view.dart';
import 'package:flutter/material.dart';

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

  List<Products>? products;
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

  void navigateToCategoryProducts(context, String title, String categoryId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CategoryProductView(
          title: title,
          categoryId: categoryId,
        ),
      ),
    );
  }

  List<CategoryProductsModel>? categoryProducts;
  void getAllCategoryProducts(String categoryId, context) async {
    log('start');
    isLoading = true;
    notifyListeners();
    await CategoryProductService()
        .getAllCategoryProducts(categoryId, context)
        .then((value) {
      if (value != null) {
        categoryProducts = value;
        isLoading = false;
        notifyListeners();
      }
    });
    log('end');
    isLoading = false;
    notifyListeners();
  }

  CarousalModel? carousal;
  void getCarousal(context) async {
    isLoading = true;
    notifyListeners();
    await CarousalGetService.carousalGetService(context).then((value) {
      if (value != null) {
        carousal = value;
        isLoading = false;
        notifyListeners();
      }
    });

    isLoading = false;
    notifyListeners();
  }
}
