import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Widgets/Price_summary_card.dart';
import 'package:snappis/Presentation/Widgets/Promo_code.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class PublishCampaign extends StatefulWidget {
  const PublishCampaign({super.key});

  @override
  State<PublishCampaign> createState() => _PublishCampaignState();
}

class _PublishCampaignState extends State<PublishCampaign> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Publish Campaign",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const PriceSummaryCard(),

              const SizedBox(height: 20),

              const Text("Have a pramotional\nCode ?"),

              const SizedBox(height: 10),

              const PromoCodeRow(),

              const Spacer(),

              SecprimarBtn(
                text: "Pay",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}