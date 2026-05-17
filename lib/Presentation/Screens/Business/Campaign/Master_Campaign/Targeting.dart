import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Campaign_detailing.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_field_label.dart';
import '../widgets/campaign_text_field.dart';
import '../widgets/campaign_option_card.dart';
import '../widgets/campaign_dropdown_field.dart';

class Targeting extends StatefulWidget {
  const Targeting({super.key});

  @override
  State<Targeting> createState() => _TargetingState();
}

class _TargetingState extends State<Targeting> {
  String selectedGender = "Female";
  String selectedAge = "18 - 25";

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
          "Targeting",
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
              "Step 3 of 4",
              style: TextStyle(color: Colors.black54, fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),
            
            // 1. Stepper UI
            const CampaignStepper(currentStep: 3),

            SizedBox(height: 24.h),

            // 2. Campaign Description
            const CampaignFieldLabel(label: "Campaign Description"),
            const CampaignTextField(
              hint: "Enter your description",
              maxLines: 4,
            ),

            SizedBox(height: 20.h),

            // 3. Gender
            const CampaignFieldLabel(label: "Gender"),
            Row(
              children: [
                Expanded(
                  child: CampaignOptionCard(
                    label: "Male",
                    isSelected: selectedGender == "Male",
                    onTap: () => setState(() => selectedGender = "Male"),
                  ),
                ),
                Expanded(
                  child: CampaignOptionCard(
                    label: "Female",
                    isSelected: selectedGender == "Female",
                    onTap: () => setState(() => selectedGender = "Female"),
                  ),
                ),
                Expanded(
                  child: CampaignOptionCard(
                    label: "Other",
                    isSelected: selectedGender == "Other",
                    onTap: () => setState(() => selectedGender = "Other"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // 4. Age
            const CampaignFieldLabel(label: "Age"),
            Row(
              children: [
                Expanded(
                  child: CampaignOptionCard(
                    label: "18 - 25",
                    isSelected: selectedAge == "18 - 25",
                    onTap: () => setState(() => selectedAge = "18 - 25"),
                  ),
                ),
                Expanded(
                  child: CampaignOptionCard(
                    label: "25 - 35",
                    isSelected: selectedAge == "25 - 35",
                    onTap: () => setState(() => selectedAge = "25 - 35"),
                  ),
                ),
                Expanded(
                  child: CampaignOptionCard(
                    label: "Above 35",
                    isSelected: selectedAge == "Above 35",
                    onTap: () => setState(() => selectedAge = "Above 35"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            // 5. Do's and Dont's
            Row(
              children: [
                Expanded(
                  child: CampaignDropdownField(
                    hint: "Do's",
                    onTap: () {
                      // Selection logic for Do's
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: CampaignDropdownField(
                    hint: "Dont's",
                    onTap: () {
                      // Selection logic for Dont's
                    },
                  ),
                ),
              ],
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
                onPressed: () => Get.to(() => const CampaignDetailing()),
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
