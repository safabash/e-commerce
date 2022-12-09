class AddressDeleteModel {
  bool? success;
  String? message;
  AddressDeleteModel({
    this.message,
    this.success,
  });
  factory AddressDeleteModel.fromJson(Map<String, dynamic> json) =>
      AddressDeleteModel(
        success: json["success"],
        message: json["message"],
      );
}
