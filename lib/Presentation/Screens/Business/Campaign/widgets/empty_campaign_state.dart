import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyCampaignState extends StatelessWidget {
  const EmptyCampaignState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Campaign Available",
        style: TextStyle(
          color: Colors.black45,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
