import 'package:flutter/material.dart';

class CampaignTabBar extends StatelessWidget {
  final TabController tabController;

  const CampaignTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black12),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFF9136F3),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
