import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class LocationTile extends StatelessWidget {
  final String title;
  const LocationTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: AppColors.chip,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w500)),
    );
  }
}
