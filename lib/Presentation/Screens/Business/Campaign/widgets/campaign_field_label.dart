import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignFieldLabel extends StatelessWidget {
  final String label;

  const CampaignFieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0.h),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black87,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
