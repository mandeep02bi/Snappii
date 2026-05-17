import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Widgets/Creator_campaign_card.dart';

class Ccampaign extends StatefulWidget {
  const Ccampaign({super.key});

  @override
  State<Ccampaign> createState() => _CcampaignState();
}

class _CcampaignState extends State<Ccampaign> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Explore campaign",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              const CreatorCampaignCard(),
            ],
          ),
        ),
      ),
    );
  }
}