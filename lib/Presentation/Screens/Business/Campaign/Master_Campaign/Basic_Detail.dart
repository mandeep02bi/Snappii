import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Influencer.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_field_label.dart';
import '../widgets/campaign_text_field.dart';
import '../widgets/campaign_dropdown_field.dart';
import '../widgets/campaign_location_section.dart';
import '../widgets/campaign_selection_modal.dart';
import '../widgets/campaign_date_picker_modal.dart';
import 'package:intl/intl.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({super.key});

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  String? selectedLocationType;
  String selectedCategory = "";
  String selectedDeadline = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Basic Details",
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
              "Step 1 of 4",
              style: TextStyle(color: Colors.black54, fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),

            // 1. Stepper UI
            const CampaignStepper(currentStep: 1),

            SizedBox(height: 24.h),

            // 2. Form Fields
            const CampaignFieldLabel(label: "Campaign Name"),
            const CampaignTextField(hint: "Enter Name"),

            SizedBox(height: 20.h),

            const CampaignFieldLabel(label: "Influencer Category"),
            CampaignDropdownField(
              hint: selectedCategory.isEmpty
                  ? "Select Category"
                  : selectedCategory,
              onTap: () {
                showCampaignSelection(
                  context: context,
                  title: "Influencer Category",
                  searchHint: "Search",
                  options: const ["Beauty"],
                  onSelected: (val) {
                    setState(() => selectedCategory = val);
                  },
                );
              },
            ),

            SizedBox(height: 20.h),

            const CampaignFieldLabel(label: "Deadline"),
            CampaignDropdownField(
              hint: selectedDeadline.isEmpty ? "Select Date" : selectedDeadline,
              onTap: () {
                showCampaignDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  onDateSelected: (date) {
                    setState(() {
                      selectedDeadline = DateFormat('dd MMM yyyy').format(date);
                    });
                  },
                );
              },
            ),

            SizedBox(height: 24.h),

            // 3. Creator's Location Section
            CampaignLocationSection(
              selectedValue: selectedLocationType,
              onChanged: (val) {
                setState(() {
                  selectedLocationType = val;
                });

                // Show modal based on selection
                if (val == "state") {
                  showCampaignSelection(
                    context: context,
                    title: "Select State",
                    searchHint: "Search a particular State",
                    options: const ["Assam"],
                    onSelected: (selected) {
                      // Handle state selection
                    },
                  );
                } else if (val == "city") {
                  showCampaignSelection(
                    context: context,
                    title: "Select City",
                    searchHint: "Search a particular City",
                    options: const ["New Delhi"],
                    onSelected: (selected) {
                      // Handle city selection
                    },
                  );
                }
              },
            ),

            SizedBox(height: 40.h),

            // 4. Next Button
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
                onPressed: () => Get.to(() => const Influencer()),
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
