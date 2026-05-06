import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class UploadCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String helper;
  final bool showHelper;

  const UploadCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.helper = "",
    this.showHelper = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.lightBg,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Optional",
                    style: TextStyle(fontSize: 12)),
              )
            ],
          ),

          const SizedBox(height: 14),

          /// Upload Area
          Container(
            height: 160,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.border,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: const Icon(Icons.add,
                      color: AppColors.primary),
                ),
                const SizedBox(height: 10),
                Text(subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13)),
                if (showHelper) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.lightBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(helper,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12)),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
