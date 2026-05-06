import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class PricingChip extends StatelessWidget {
  final String title;
  const PricingChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(title),
    );
  }
}
