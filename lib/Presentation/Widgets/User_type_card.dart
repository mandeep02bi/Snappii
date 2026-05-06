import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class UserTypeCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback onTap;

  const UserTypeCard({
    super.key,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 28),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderPink, width: 2),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Image.asset(iconPath, height: 60),
          ],
        ),
      ),
    );
  }
}
