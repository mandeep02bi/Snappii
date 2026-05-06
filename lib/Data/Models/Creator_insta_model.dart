class CreatorInstaModel {
  final String userId;
  final String name;
  final String instagramUsername;
  final String profilePictureUrl;
  final String categoryName;
  final int followersCount;
  final int avgReelViews;

  CreatorInstaModel({
    required this.userId,
    required this.name,
    required this.instagramUsername,
    required this.profilePictureUrl,
    required this.categoryName,
    required this.followersCount,
    required this.avgReelViews,
  });

  factory CreatorInstaModel.fromJson(Map<String, dynamic> json) {
    return CreatorInstaModel(
      userId: json['user_id'],
      name: json['name'],
      instagramUsername: json['instagram_username'],
      profilePictureUrl: json['profile_picture_url'] ?? '',
      categoryName: json['category_name'] ?? '',
      followersCount: json['followers_count'] ?? 0,
      avgReelViews: json['avg_reel_views'] ?? 0,
    );
  }
}
