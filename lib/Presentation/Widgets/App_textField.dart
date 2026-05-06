import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snappis/Core/utils/Colors.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? suffix;
  final String? label;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInput;
  

  const AppTextField({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.suffix,
    this.label,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.textInput,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
       keyboardType: keyboardType,
       inputFormatters: textInput,
      controller: controller,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hint,
        suffixText: suffix,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }
}
