import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CreatorCampaignCard extends StatefulWidget {
  const CreatorCampaignCard({super.key});

  @override
  State<CreatorCampaignCard> createState() => _CreatorCampaignCardState();
}

class _CreatorCampaignCardState extends State<CreatorCampaignCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image + bookmark
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                child: Image.asset(
                  "assets/food_shop.jpg",
                  height: 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Container(
                  padding: EdgeInsets.all(6.r),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.bookmark_border, size: 20.r),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Food Shop",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text("Reels+Story", style: TextStyle(fontSize: 14.sp)),
                Text("Followers 100K", style: TextStyle(fontSize: 14.sp)),
                Text("Category: Lifestyle", style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: 12.sp,
                      decoration: TextDecoration.underline,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
