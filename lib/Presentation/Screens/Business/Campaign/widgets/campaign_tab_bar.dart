import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignTabBar extends StatelessWidget {
  final TabController tabController;

  const CampaignTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: Colors.black12),
      ),
      child: TabBar(
        controller: tabController,
        labelPadding: EdgeInsets.symmetric(horizontal: 2.w),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: const Color(0xFF9136F3),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: TextStyle(
          fontSize: 11.5.sp,
          fontWeight: FontWeight.bold,
        ),
        tabs: const [
          Tab(text: "Active"),
          Tab(text: "Pending"),
          Tab(text: "Complete"),
          Tab(text: "Draft"),
        ],
      ),
    );
  }
}
