// data/models/creator_model.dart
import 'package:snappis/Domains/Entities/Creator_entities.dart';


class CreatorModel extends CreatorEntity {
  CreatorModel({
    required super.id,
    required super.name,
    required super.category,
    required super.imageUrl,
    required super.followers,
    required super.avgViews,
    required super.reelsFrom,
  });

  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      followers: json['followers'],
      avgViews: json['avgViews'],
      reelsFrom: json['reelsFrom'],
    );
  }
}
