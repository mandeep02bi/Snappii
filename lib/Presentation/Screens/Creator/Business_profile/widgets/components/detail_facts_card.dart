import 'package:flutter/material.dart';

class BusinessProfileDetailFactsCard extends StatelessWidget {
  const BusinessProfileDetailFactsCard({
    super.key,
    required this.title,
    this.foundedLabel,
    this.locationLabel,
    this.fallbackBody,
  });

  final String title;
  final String? foundedLabel;
  final String? locationLabel;
  final String? fallbackBody;

  @override
  Widget build(BuildContext context) {
    const lightLavender = Color(0xFFEFEAFB);
    const dividerColor = Color(0xFFD6C8F2);
    const greyTextColor = Color(0xFF7A7A7A);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: lightLavender,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(height: 1, width: double.infinity, color: dividerColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Text(
              _buildContentText(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: greyTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _buildContentText() {
    if (fallbackBody != null && fallbackBody!.isNotEmpty) {
      return fallbackBody!;
    }

    List<String> parts = [];
    if (foundedLabel != null && foundedLabel!.isNotEmpty) {
      parts.add(foundedLabel!);
    }
    if (locationLabel != null && locationLabel!.isNotEmpty) {
      parts.add('Location : ${locationLabel!}');
    }

    return parts.join(' ');
  }
}
