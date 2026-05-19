import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_theme.dart';

class BrandEditProfileLabeledField extends StatelessWidget {
  const BrandEditProfileLabeledField({
    super.key,
    required this.label,
    required this.controller,
    this.maxLines = 1,
    this.minHeight = 46,
  });

  final String label;
  final TextEditingController controller;
  final int maxLines;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: BrandEditProfileTheme.labelTextStyle),
        const SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: minHeight),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            style: BrandEditProfileTheme.fieldTextStyle,
            decoration: const InputDecoration(),
          ),
        ),
      ],
    );
  }
}
