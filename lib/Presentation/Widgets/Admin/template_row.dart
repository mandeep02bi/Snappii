import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Core/utils/apptextstyle.dart';


class TemplateRow extends StatelessWidget {
  final String name;

  const TemplateRow({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(name, style: AppTextStyles.row),
          ),
          Icon(Icons.visibility, color: AppColors.blue),
        ],
      ),
    );
  }
}
