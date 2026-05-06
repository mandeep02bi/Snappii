import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;

    switch (status) {
      case "Completed":
        color = AppColors.green;
        break;
      case "Pending":
        color = AppColors.yellow;
        break;
      case "Failed":
        color = AppColors.red;
        break;
      default:
        color = Colors.grey;
    }

    return Row(
      children: [
        CircleAvatar(radius: 5, backgroundColor: color),
        const SizedBox(width: 6),
        Text(status),
      ],
    );
  }
}
