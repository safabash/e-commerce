import 'dart:developer';

import 'package:e_commerce_app/model/wishlist/wishlist_get_model.dart';
import 'package:flutter/material.dart';

import '../../service/wishlist/wishlist_delete_service.dart';
import '../../service/wishlist/wishlist_get_service.dart';
import '../../service/wishlist/wishlist_post_service.dart';
import '../../view/widgets/app_pop_up.dart';

class ScreenWishlistProvider with ChangeNotifier {
  bool isLoading = false;
  List<WishlistGetModel> wishListProductElement = [];
  num? offerPrice;

  void addToWishlist(String productId, context) async {
    await WishlistPostService.wishlistPostService(productId, context)
        .then((value) {
      if (value == true) {
        AppPopUp.showToast(context, 'Added To Wishlist', Colors.green);
      }
    });
    getAllWishlistProducts(context);
  }

  void getAllWishlistProducts(context) async {
    isLoading = true;
    notifyListeners();
    await WishlistGetService.wishlistGetService(context).then((value) {
      if (value != null) {
        wishListProductElement = value;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void deleteWishlistItem(String productId, context) async {
    await WishlistDeteteItemService.wishlistDeteteItemService(
            productId, context)
        .then((value) {
      if (value != null) {
        AppPopUp.showToast(context, value.message.toString(), Colors.red);
      }
    });
    getAllWishlistProducts(context);
  }
}
