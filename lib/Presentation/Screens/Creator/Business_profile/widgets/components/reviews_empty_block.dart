import 'package:flutter/material.dart';

class BusinessProfileReviewsEmptyBlock extends StatelessWidget {
  const BusinessProfileReviewsEmptyBlock({
    super.key,
    required this.title,
    this.subtitle,
    this.scale = 1,
  });

  final String title;
  final String? subtitle;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 28 * scale,
        horizontal: 8 * scale,
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: tt.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: cs.onSurface.withValues(alpha: 0.72),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
