import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class UploadField extends StatelessWidget {
  const UploadField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: const [
          Text(
            "Choose File",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "No file chosen",
              style: TextStyle(color: AppColors.label),
            ),
          ),
        ],
      ),
    );
  }
}
