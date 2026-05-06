import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class StatusChip extends StatelessWidget {
  final String status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final isActive = status == "Active";

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.green.withOpacity(.15)
            : Colors.grey.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          color:
              isActive ? AppColors.green : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
