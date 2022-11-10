class HomeCategoryModel {
  final int id;
  final String name;
  final String image;
  HomeCategoryModel({
    required this.id,
    required this.image,
    required this.name,
  });
  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeCategoryModel(
      id: json['id'],
      image: json['icon'],
      name: json['category'],
    );
  }
}
