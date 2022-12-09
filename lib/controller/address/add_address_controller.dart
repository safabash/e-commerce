import 'dart:developer';

import 'package:e_commerce_app/model/address/address_post_model.dart';
import 'package:e_commerce_app/service/address/post_address_service.dart';
import 'package:e_commerce_app/view/delivery_address/delivery_address.dart';
import 'package:flutter/material.dart';

import '../../model/address/address_delete_model.dart';
import '../../model/address/address_get_model.dart';
import '../../service/address/delete_address_service.dart';
import '../../service/address/get_address_service.dart';

class AddressController with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  Future<void> saveAddress(context, formKey) async {
    if (formKey.currentState!.validate()) {
      final user = AddressPostModel(
          name: nameController.text,
          phone: phoneController.text,
          pincode: pincodeController.text,
          city: cityController.text,
          address: addressController.text);
      await AddressPostService.postAddress(user, context).then((value) {
        if (value != null) {
          Navigator.of(context).pop();
        }
      });
    }
  }

  String? nameValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  String? addressValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  String? cityValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  String? pincodeValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value.length < 6) {
      return 'Please enter 6 digits';
    }
    return null;
  }

  String? phoneValidator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    if (value.length < 10) {
      return 'Please enter 10 digits';
    }
    return null;
  }

  void disposeField() {
    nameController.clear();
    addressController.clear();
    cityController.clear();
    pincodeController.clear();
    phoneController.clear();
  }

  //delivery address
  List<AddressGetModel> address = [];

  int selectedType = 0;
  void radionButtonChange(int index) {
    selectedType = index;
    notifyListeners();
  }

  void getAddressFn(context) async {
    isLoading = true;
    notifyListeners();
    await AddressGetService.getAddress(context).then((value) {
      if (value != null) {
        log('not null');
        address = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      }
    });

    isLoading = false;
    notifyListeners();
  }

  AddressDeleteModel? deleteAdd;
  void deleteAddress(addressId, context) async {
    isLoading = true;
    notifyListeners();
    await AddressDeleteService.deleteAddress(addressId, context).then((value) {
      if (value != null) {
        log('not null');
        deleteAdd = value;
        notifyListeners();
        isLoading = false;
        notifyListeners();
      }
    });

    isLoading = false;
    notifyListeners();
  }

  showDeleteAlert(BuildContext context, String? addressId) async {
    // set up the buttons

    // set up the AlertDialog

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Delete"),
          content: const Text("Are you sure you want to delete this address?"),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(ctx);
              },
            ),
            TextButton(
              child: const Text("Delete"),
              onPressed: () {
                deleteAddress(addressId, context);
                notifyListeners();
                getAddressFn(context);
                notifyListeners();
                Navigator.pop(ctx);
              },
            ),
          ],
        );
      },
    );

    notifyListeners();
  }
}
