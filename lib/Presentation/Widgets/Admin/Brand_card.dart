import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/Brand_entity.dart';
import 'package:snappis/Presentation/Widgets/Admin/Statuschip.dart';


class BrandCard extends StatelessWidget {
  final BrandEntity brand;

  const BrandCard({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            brand.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(brand.company),
          Text(brand.campaign),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.circle,
                  size: 10,
                  color: AppColors.yellow),
              const SizedBox(width: 6),
              const Text("Paused"),
              const Spacer(),
              StatusChip(status: brand.status),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Details",
              style: TextStyle(
                  color: AppColors.greyText),
            ),
          )
        ],
      ),
    );
  }
}
