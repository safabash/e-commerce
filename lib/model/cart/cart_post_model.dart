class CartPostModel {
  String? productId;
  String? size;
  String? color;
  CartPostModel({this.productId, this.color, this.size});
  Map<String, dynamic> toJson() =>
      {"productId": productId, "size": size, "color": color};
}
