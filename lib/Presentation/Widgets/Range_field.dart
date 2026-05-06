import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class RangeField extends StatelessWidget {
  final String value;

  const RangeField({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: value,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.border),
          ),
        ),
      ),
    );
  }
}
