class Products {
  Products({
    this.id,
    this.name,
    this.price,
    this.size,
    this.colors,
    this.inventory,
    this.description,
    this.offer,
    this.ratings,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? name;
  int? price;
  List<String>? size;
  List<Color>? colors;
  int? inventory;
  String? description;
  int? offer;
  List<dynamic>? ratings;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        size: List<String>.from(json["size"].map((x) => x)),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        description: json["description"],
        offer: json["offer"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );
}

class Color {
  Color({
    this.color,
    this.images,
    this.id,
  });

  String? color;
  List<String>? images;
  String? id;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        color: json["color"],
        images: List<String>.from(json["images"].map((x) => x)),
        id: json["_id"],
      );
}
