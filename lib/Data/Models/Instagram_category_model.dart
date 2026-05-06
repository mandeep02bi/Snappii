import 'package:snappis/Domains/Entities/Instagra_category.dart';


class InstagramCategoryModel extends InstagramCategory {
  InstagramCategoryModel({
    required super.id,
    required super.name,
    required super.abbreviation,
    required super.createdAt,
  });

  factory InstagramCategoryModel.fromJson(Map<String, dynamic> json) {
    return InstagramCategoryModel(
      id: json['id'],
      name: json['category_name'],
      abbreviation: json['abbreviation'],
      createdAt: json['created_at'],
    );
  }
}
