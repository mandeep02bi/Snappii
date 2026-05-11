import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CampaignStepHeader extends StatelessWidget {
  final String title;
  final int currentStep;
  final int totalSteps;

  const CampaignStepHeader({
    super.key,
    required this.title,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 6),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Step $currentStep/$totalSteps",
            style: const TextStyle(color: Colors.black54, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
