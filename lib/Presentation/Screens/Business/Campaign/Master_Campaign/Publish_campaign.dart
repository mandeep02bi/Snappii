import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PublishCampaign extends StatefulWidget {
  const PublishCampaign({super.key});

  @override
  State<PublishCampaign> createState() => _PublishCampaignState();
}

class _PublishCampaignState extends State<PublishCampaign> {
  bool agreeToTerms = true;

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
          "Publish Campaign",
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
            SizedBox(height: 20.h),

            // 1. Payment Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F6FF),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                  color: const Color(0xFFE1D0FF).withOpacity(0.5),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.campaign_outlined,
                        color: const Color(0xFF9136F3),
                        size: 20.r,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Campaign",
                        style: TextStyle(
                          color: const Color(0xFF9136F3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  const Divider(
                    color: Colors.black12,
                    thickness: 1,
                    endIndent: 20,
                    indent: 20,
                  ),
                  SizedBox(height: 12.h),
                  _buildPriceRow("Primary Fee", "₹ 349"),
                  SizedBox(height: 12.h),
                  _buildPriceRow("Fee", "+ ₹ 99"),
                  SizedBox(height: 16.h),
                  Container(
                    height: 2.h,
                    color: const Color(0xFFE1D0FF),
                    width: double.infinity,
                  ),
                  SizedBox(height: 16.h),
                  _buildPriceRow("Total", "₹ 448", isBold: true),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // 2. Promotional Code Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF9FF),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Promotional Code",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: const Color(0xFFE1D0FF)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(fontSize: 13.sp, color: Colors.black87),
                            decoration: InputDecoration(
                              hintText: "Have a promotional code?",
                              hintStyle: TextStyle(
                                color: Colors.black26,
                                fontSize: 13.sp,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30.h,
                          width: 1.w,
                          color: const Color(0xFFE1D0FF),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Apply",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // 3. Terms & Conditions
            GestureDetector(
              onTap: () => setState(() => agreeToTerms = !agreeToTerms),
              child: Row(
                children: [
                  Container(
                    width: 22.w,
                    height: 22.w,
                    decoration: BoxDecoration(
                      color: agreeToTerms
                          ? const Color(0xFF4A6572)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        color: agreeToTerms
                            ? const Color(0xFF4A6572)
                            : Colors.black26,
                        width: 2.w,
                      ),
                    ),
                    child: agreeToTerms
                        ? Icon(Icons.check, color: Colors.white, size: 16.r)
                        : null,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "I Agree with the term & Condition Policy",
                    style: TextStyle(color: Colors.black54, fontSize: 13.sp),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            // 4. Proceed to Payment Button
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
                onPressed: () {
                  // Final payment action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                child: Text(
                  "Proceed to Payment",
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

  Widget _buildPriceRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 15.sp,
              color: isBold ? Colors.black87 : Colors.black54,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
