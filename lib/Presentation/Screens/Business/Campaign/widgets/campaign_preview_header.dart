import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CampaignPreviewHeader extends StatelessWidget {
  final String title;

  const CampaignPreviewHeader({
    super.key,
    this.title = "Preview",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
