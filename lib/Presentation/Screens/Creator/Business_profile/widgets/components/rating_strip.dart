import 'package:flutter/material.dart';

class BusinessProfileRatingStrip extends StatelessWidget {
  const BusinessProfileRatingStrip({
    super.key,
    required this.average,
    required this.totalCount,
    this.scale = 1,
  });

  final double average;
  final int totalCount;
  final double scale;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14 * scale, vertical: 10 * scale),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(12 * scale),
        border: Border.all(color: cs.outline.withValues(alpha: 0.12)),
      ),
      child: Row(
        children: [
          Icon(Icons.star_rounded, color: cs.primary, size: 26 * scale),
          SizedBox(width: 8 * scale),
          Text(
            average.toStringAsFixed(1),
            style: tt.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: cs.onSurface,
            ),
          ),
          SizedBox(width: 6 * scale),
          Expanded(
            child: Text(
              '·  $totalCount ratings',
              style: tt.bodySmall?.copyWith(
                color: cs.onSurface.withValues(alpha: 0.55),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: cs.outline, size: 22 * scale),
        ],
      ),
    );
  }
}
