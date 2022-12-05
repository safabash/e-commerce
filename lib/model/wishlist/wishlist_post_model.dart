class AddWishlistModel {
  AddWishlistModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory AddWishlistModel.fromJson(Map<String, dynamic> json) =>
      AddWishlistModel(
        success: json["success"],
        message: json["message"],
      );
}
