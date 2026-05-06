import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class ToggleTile extends StatelessWidget {
  final String title;
  final bool value;

  const ToggleTile({
    super.key,
    required this.title,
    this.value = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Switch(
            value: value,
            onChanged: (_) {},
            activeColor: AppColors.green,
          ),
        ],
      ),
    );
  }
}
