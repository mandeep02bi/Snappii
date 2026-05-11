import 'package:flutter/material.dart';

class CampaignDropdownField extends StatelessWidget {
  final String hint;
  final VoidCallback? onTap;

  const CampaignDropdownField({super.key, required this.hint, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              hint.isEmpty ? "Select" : hint,
              style: TextStyle(
                color: hint.isEmpty ? Colors.black26 : Colors.black87,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
