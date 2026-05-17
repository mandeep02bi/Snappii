import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Center(
      child: SizedBox(
        width: 290
            .w, // Made it even longer ("أطول") to stretch beautifully across the screen
        child: Row(
          children: List.generate(totalSteps * 2 - 1, (index) {
            if (index.isEven) {
              // Circle step node
              int step = (index ~/ 2) + 1;
              bool isActive = step <= currentStep;
              return Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF9136F3)
                      : const Color(0xFFE8DEFF),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "$step",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else {
              // Connecting line
              int lineIndex = index ~/ 2;
              bool isActive = lineIndex < currentStep;
              return Expanded(
                child: Container(
                  height: 10
                      .h, // Made it even thicker ("أعرض") for a very bold progress pill (10.h)
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFF9136F3)
                        : const Color(0xFFE8DEFF),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
