import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Publish_campaign.dart';
import '../widgets/campaign_preview_box.dart';
import '../widgets/campaign_info_badge.dart';
import '../widgets/campaign_secondary_button.dart';

class McampaignPreview extends StatelessWidget {
  const McampaignPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: -10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF9136F3),
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Preview",
          style: TextStyle(
            color: Color(0xFF9136F3),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Top Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFBF9FF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/banner.png",
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Campaign Details",
                    style: TextStyle(
                      color: Color(0xFFBB93FF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Clothes Shop",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: const [
                      CampaignInfoBadge(icon: Icons.account_balance_wallet, text: "₹1000"),
                      SizedBox(width: 20),
                      CampaignInfoBadge(icon: Icons.calendar_month, text: "5 days"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text.rich(
                    TextSpan(
                      text: "Category : ",
                      style: TextStyle(color: Color(0xFFBB93FF), fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Lifestyle",
                          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  CampaignPreviewBox(
                    items: [
                      CampaignPreviewItemData(icon: Icons.movie_outlined, label: "Reel 1"),
                      CampaignPreviewItemData(icon: Icons.play_circle_outline, label: "Story 1"),
                      CampaignPreviewItemData(icon: Icons.camera_alt_outlined, label: "Post 1"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Influencer Requirements",
                    style: TextStyle(
                      color: Color(0xFFBB93FF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  CampaignPreviewBox(
                    items: [
                      CampaignPreviewItemData(icon: Icons.person_outline, label: "10K"),
                      CampaignPreviewItemData(icon: Icons.accessibility_new, label: "Age 18-25"),
                      CampaignPreviewItemData(icon: Icons.face_retouching_natural, label: "Gender"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Influencer Required : 0/ 50",
                    style: TextStyle(
                      color: Color(0xFFBB93FF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8DEFF),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.0, // 0/50
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9136F3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "0 of 50 Influencers found",
                    style: TextStyle(color: Colors.black26, fontSize: 12),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 2. About Campaign Card
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black.withOpacity(0.05)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "About Campaign",
                    style: TextStyle(
                      color: Color(0xFFBB93FF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Artificial Intelligence (AI) is technology enabling machines to mimic human intelligence, learning from data to reason, solve problems.",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: CampaignSecondaryButton(
                    icon: Icons.edit_outlined,
                    label: "Edit",
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CampaignSecondaryButton(
                    icon: Icons.description_outlined,
                    label: "Draft",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB93FF), Color(0xFF5765FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF5765FF).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () => Get.to(() => const PublishCampaign()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Publish",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
