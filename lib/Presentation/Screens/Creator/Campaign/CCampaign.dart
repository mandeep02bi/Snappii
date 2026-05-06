import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  "Explore campaign",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 20),

              CreatorCampaignCard(),
            ],
          ),
        ),
      ),

      /// Bottom Navigation
    );
  }
}