import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Publish_campaign.dart';
import '../widgets/campaign_preview_box.dart';
import '../widgets/campaign_info_badge.dart';
import '../widgets/campaign_secondary_button.dart';

class McampaignPreview extends StatelessWidget {
  const McampaignPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: -10.w,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: const Color(0xFF9136F3),
            size: 20.r,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "Preview",
          style: TextStyle(
            color: const Color(0xFF9136F3),
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Card
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF9FF),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      "assets/images/banner.png",
                      height: 160.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Campaign Details",
                    style: TextStyle(
                      color: const Color(0xFFBB93FF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Clothes Shop",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      const CampaignInfoBadge(icon: Icons.account_balance_wallet, text: "₹1000"),
                      SizedBox(width: 20.w),
                      const CampaignInfoBadge(icon: Icons.calendar_month, text: "5 days"),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text.rich(
                    TextSpan(
                      text: "Category : ",
                      style: TextStyle(color: const Color(0xFFBB93FF), fontWeight: FontWeight.bold, fontSize: 14.sp),
                      children: [
                        TextSpan(
                          text: "Lifestyle",
                          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.normal, fontSize: 14.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CampaignPreviewBox(
                    items: [
                      CampaignPreviewItemData(icon: Icons.movie_outlined, label: "Reel 1"),
                      CampaignPreviewItemData(icon: Icons.play_circle_outline, label: "Story 1"),
                      CampaignPreviewItemData(icon: Icons.camera_alt_outlined, label: "Post 1"),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Influencer Requirements",
                    style: TextStyle(
                      color: const Color(0xFFBB93FF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  CampaignPreviewBox(
                    items: [
                      CampaignPreviewItemData(icon: Icons.person_outline, label: "10K"),
                      CampaignPreviewItemData(icon: Icons.accessibility_new, label: "Age 18-25"),
                      CampaignPreviewItemData(icon: Icons.face_retouching_natural, label: "Gender"),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Influencer Required : 0/ 50",
                    style: TextStyle(
                      color: const Color(0xFFBB93FF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 8.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8DEFF),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.0, // 0/50
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9136F3),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "0 of 50 Influencers found",
                    style: TextStyle(color: Colors.black26, fontSize: 12.sp),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // 2. About Campaign Card
            Container(
              padding: EdgeInsets.all(16.r),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About Campaign",
                    style: TextStyle(
                      color: const Color(0xFFBB93FF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Artificial Intelligence (AI) is technology enabling machines to mimic human intelligence, learning from data to reason, solve problems.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13.sp,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            // 3. Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: CampaignSecondaryButton(
                    icon: Icons.edit_outlined,
                    label: "Edit",
                    onTap: () {},
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: CampaignSecondaryButton(
                    icon: Icons.description_outlined,
                    label: "Draft",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25.r),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5765FF).withOpacity(0.3),
                    blurRadius: 10.r,
                    offset: Offset(0, 5.h),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const PublishCampaign()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  "Publish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
