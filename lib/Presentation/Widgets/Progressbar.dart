import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class ProgressRow extends StatelessWidget {
  final String label;
  final double value;

  const ProgressRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 40, child: Text(label)),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade300,
            color: AppColors.primary,
            minHeight: 6,
          ),
        ),
      ],
    );
  }
}
