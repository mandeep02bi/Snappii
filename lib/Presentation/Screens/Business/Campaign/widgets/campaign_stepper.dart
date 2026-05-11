import 'package:flutter/material.dart';

class CampaignStepper extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CampaignStepper({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        int step = index + 1;
        bool isActive = step <= currentStep;
        return Expanded(
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xFF9136F3) : const Color(0xFFE8DEFF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$step",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
              if (index < totalSteps - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    color: isActive ? const Color(0xFF9136F3) : const Color(0xFFE8DEFF),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
