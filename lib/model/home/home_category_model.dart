class HomeCategoryModel {
  HomeCategoryModel({
    this.id,
    this.category,
    this.icon,
    this.homeCategoryModelId,
    this.subCategories,
  });

  String? id;
  String? category;
  String? icon;
  int? homeCategoryModelId;
  List<SubCategory>? subCategories;

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      HomeCategoryModel(
        id: json["_id"],
        category: json["category"],
        icon: json["icon"],
        homeCategoryModelId: json["id"],
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
