import 'package:flutter/material.dart';

class BusinessProfileIdentityRow extends StatelessWidget {
  const BusinessProfileIdentityRow({
    super.key,
    required this.avatarUrl,
    required this.brandName,
    required this.categoryLabel,
    required this.avatarDiameter,
    this.tagline,
  });

  final String avatarUrl;
  final String brandName;
  final String categoryLabel;
  final double avatarDiameter;
  final String? tagline;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/Ellipse 64 copy.png',
                  width: avatarDiameter * 1.2,
                  height: avatarDiameter * 1.2,
                  fit: BoxFit.contain,
                ),
                ClipOval(
                  child: Container(
                    width: avatarDiameter,
                    height: avatarDiameter,
                    color: Colors.grey[200],
                    child: avatarUrl.isNotEmpty
                        ? Image.network(
                            avatarUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.person, color: Colors.grey),
                          )
                        : const Icon(Icons.person, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(width: avatarDiameter * 0.12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        brandName,
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          categoryLabel,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500, // Medium
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (tagline != null && tagline!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      tagline!,
                      style: textTheme.bodySmall?.copyWith(
                        height: 1.35,
                        color: colorScheme.onSurface.withOpacity(0.55),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
