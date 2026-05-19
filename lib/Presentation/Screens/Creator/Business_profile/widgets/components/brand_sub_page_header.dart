import 'package:flutter/material.dart';

class BrandSubPageHeader extends StatelessWidget {
  const BrandSubPageHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.titleColor,
    this.iconColor,
  });

  final String title;
  final VoidCallback onBack;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final themeColor = iconColor ?? titleColor ?? const Color(0xFFA470FF);
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 12, 15, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: themeColor,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: themeColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
