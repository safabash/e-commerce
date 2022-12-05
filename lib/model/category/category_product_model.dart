class CategoryProductsModel {
  CategoryProductsModel({
    this.id,
    this.name,
    this.category,
    this.price,
    this.size,
    this.colors,
    this.inventory,
    this.description,
    this.offer,
    this.ratings,
  });

  String? id;
  String? name;
  Category? category;
  int? price;
  List<dynamic>? size;
  List<Color>? colors;
  int? inventory;
  String? description;
  int? offer;
  List<dynamic>? ratings;

  factory CategoryProductsModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductsModel(
        id: json["_id"],
        name: json["name"],
        category: Category.fromJson(json["category"]),
        price: json["price"],
        size: List<dynamic>.from(json["size"].map((x) => x)),
        colors: List<Color>.from(json["colors"].map((x) => Color.fromJson(x))),
        inventory: json["inventory"],
        description: json["description"],
        offer: json["offer"],
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );
}

class Category {
  Category({
    this.id,
    this.category,
    this.icon,
    this.categoryId,
    this.subCategories,
  });

  String? id;
  String? category;
  String? icon;
  int? categoryId;
  List<SubCategory>? subCategories;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        category: json["category"],
        icon: json["icon"],
        categoryId: json["id"],
        subCategories: List<SubCategory>.from(
            json["subCategories"].map((x) => SubCategory.fromJson(x))),
      );
}

class SubCategory {
  SubCategory({
    this.name,
    this.id,
  });

  String? name;
  String? id;

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        name: json["name"],
        id: json["_id"],
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
