import 'dart:developer';

import 'package:e_commerce_app/model/wishlist/wishlist_get_model.dart';
import 'package:flutter/material.dart';

import '../../service/wishlist/wishlist_delete_service.dart';
import '../../service/wishlist/wishlist_get_service.dart';
import '../../service/wishlist/wishlist_post_service.dart';
import '../../view/widgets/app_pop_up.dart';

class ScreenWishlistProvider with ChangeNotifier {
  // ScreenWishlistProvider() {
  //   getAllWishlistProducts(context);
  // }
  bool isLoading = false;
  List<WishlistGetModel> wishListProductElement = [];
  num? offerPrice;

  void addToWishlist(String productId, context) async {
    WishlistPostService.wishlistPostService(productId, context).then((value) {
      if (value == true) {
        AppPopUp.showToast(context, 'Add To Wishlist', Colors.green);
      }
    });
    getAllWishlistProducts(context);
    notifyListeners();
  }

  void getAllWishlistProducts(context) async {
    isLoading = true;
    notifyListeners();
    await WishlistGetService.wishlistGetService(context).then((value) {
      if (value != null) {
        log("wishlist is Not Emptu");
        wishListProductElement = value;
        notifyListeners();
      } else {
        log("wishlist is Emptu");
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void calculateOfferPrice(WishlistGetModel product) {
    log(product.price.toString());
    offerPrice = ((product.price! / 100) * (100 - product.offer!) - 1);
    log(offerPrice.toString());
  }

  void deleteWishlistItem(String productId, context) async {
    WishlistDeteteItemService.wishlistDeteteItemService(productId, context)
        .then((value) {
      if (value != null) {
        AppPopUp.showToast(context, value.message.toString(), Colors.red);
        getAllWishlistProducts(context);
      }
    });
    getAllWishlistProducts(context);
    notifyListeners();
  }
}
