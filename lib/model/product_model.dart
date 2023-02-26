// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int? id;
  final String? name;
  final String? category;
  final String? createdAt;
  final String? updatedAt;
  ProductModel({
    this.id,
    this.name,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      createdAt: json["createdAt"],
      updatedAt: json["updatedAt"],
    );
  }
}
