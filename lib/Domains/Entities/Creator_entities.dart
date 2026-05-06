// domain/entities/creator_entity.dart
class CreatorEntity {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  final int followers;
  final int avgViews;
  final int reelsFrom;
  String? delivery;
  String? views;
  String? username;


  CreatorEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.followers,
    required this.avgViews,
    required this.reelsFrom,
    this.username, this.views,
    this.delivery,
  });
}
