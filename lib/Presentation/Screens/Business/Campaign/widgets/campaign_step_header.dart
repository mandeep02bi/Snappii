import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              icon: Icon(Icons.arrow_back, size: 24.r),
              onPressed: () => Navigator.pop(context),
            ),
            SizedBox(width: 6.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
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
            style: TextStyle(color: Colors.black54, fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}
