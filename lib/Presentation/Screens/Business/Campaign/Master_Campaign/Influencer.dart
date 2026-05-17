import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Targeting.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_field_label.dart';
import '../widgets/campaign_text_field.dart';
import '../widgets/campaign_counter_field.dart';
import '../widgets/campaign_deliverables_section.dart';

class Influencer extends StatelessWidget {
  const Influencer({super.key});

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
          "Influencer",
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
              "Step 2 of 4",
              style: TextStyle(color: Colors.black54, fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),

            // 1. Stepper UI
            const CampaignStepper(currentStep: 2),

            SizedBox(height: 24.h),

            // 2. Minimum Followers
            const CampaignFieldLabel(label: "Minimum Followers"),
            const CampaignTextField(hint: "E.g 10,000"),

            SizedBox(height: 20.h),

            // 3. Number of Influencer
            const CampaignFieldLabel(label: "Number of Influencer"),
            const CampaignCounterField(),

            SizedBox(height: 20.h),

            // 4. Deliverable by Influencer
            const CampaignFieldLabel(label: "Deliverable by Influencer"),
            const CampaignDeliverablesSection(),

            SizedBox(height: 20.h),

            // 5. Budget per Influencer
            const CampaignFieldLabel(label: "Budget per Influencer"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              child: Row(
                children: [
                  Text(
                    "₹",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 15.sp, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: "Amount",
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),
            Text(
              "Total Budget: ₹",
              style: TextStyle(fontSize: 13.sp, color: Colors.black45),
            ),

            SizedBox(height: 40.h),

            // 6. Next Button
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
                onPressed: () => Get.to(() => const Targeting()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  "Next",
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
