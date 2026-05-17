import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/MCampaign_preview.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_upload_card.dart';

class CampaignDetailing extends StatelessWidget {
  const CampaignDetailing({super.key});

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
          "Targeting", // As per UI image
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
            SizedBox(height: 10.h),
            Text(
              "Step 1 of 4", // As per UI image (even though it's step 4)
              style: TextStyle(color: Colors.black54, fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),

            // 1. Stepper UI
            const CampaignStepper(currentStep: 4),

            SizedBox(height: 24.h),

            // 2. Upload Cards
            const CampaignUploadCard(
              title: "Upload Campaign Image",
              recommendedText: "Recomaneded: Portrait\n(2:3 ratio),JPG/PNG",
            ),

            const CampaignUploadCard(title: "Upload Sample Video"),

            SizedBox(height: 20.h),

            // 3. Save as Draft Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: const Color(0xFFE1D0FF), width: 1.5.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  "Save as Draft",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // 4. Preview & Publish Button
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
                onPressed: () => Get.to(() => const McampaignPreview()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  "Preview & Publish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
