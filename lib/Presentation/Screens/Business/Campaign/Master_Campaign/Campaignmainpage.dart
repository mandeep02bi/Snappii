import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/brand_bottom_nav.dart';
import '../widgets/campaign_header.dart';
import '../widgets/campaign_tab_bar.dart';
import '../widgets/create_campaign_button.dart';
import '../widgets/empty_campaign_state.dart';

class Campaignmainpage extends StatefulWidget {
  const Campaignmainpage({super.key});

  @override
  State<Campaignmainpage> createState() => _CampaignmainpageState();
}

class _CampaignmainpageState extends State<Campaignmainpage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4A00E0),
      body: SafeArea(
        child: Column(
          children: [
            const CampaignHeader(),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    CampaignTabBar(tabController: _tabController),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          EmptyCampaignState(),
                          EmptyCampaignState(),
                          EmptyCampaignState(),
                          EmptyCampaignState(),
                        ],
                      ),
                    ),
                    const CreateCampaignButton(),
                    const BrandBottomNav(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
