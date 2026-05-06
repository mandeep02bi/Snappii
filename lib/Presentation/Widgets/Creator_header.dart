import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CreatorHeader extends StatelessWidget {
  final String? name;
  final String? username;
  final String? imageUrl;
  final int? followers;

  const CreatorHeader({
    super.key,
    this.name,
    this.username,
    this.imageUrl,
    this.followers,
  });

  String _formatFollowers(int? count) {
    if (count == null) return "0";

    if (count >= 1000000) {
      return "${(count / 1000000).toStringAsFixed(1)}M";
    } else if (count >= 1000) {
      return "${(count / 1000).toStringAsFixed(1)}K";
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.grey.shade200,
          child: ClipOval(
            child: imageUrl != null && imageUrl!.isNotEmpty
                ? Image.network(
                    "http://localhost:8000/$imageUrl",
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.person,
                        color: Colors.grey,
                        size: 28,
                      );
                    },
                  )
                : const Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 28,
                  ),
          ),
        ),

        const SizedBox(width: 12),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            Text(
              username != null ? "@$username" : "",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),

        const Spacer(),

        Text(
          _formatFollowers(followers),
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}