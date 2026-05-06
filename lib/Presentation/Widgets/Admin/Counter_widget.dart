import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CounterWidget extends StatelessWidget {
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CounterWidget({
    super.key,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColors.border,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.remove, size: 14),
            onPressed: onRemove,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(value.toString()),
        ),
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColors.purple,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add, size: 14, color: Colors.white),
            onPressed: onAdd,
          ),
        ),
      ],
    );
  }
}
