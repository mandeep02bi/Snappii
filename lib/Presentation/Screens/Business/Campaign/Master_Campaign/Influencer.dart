import 'package:flutter/material.dart';
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
          "Influencer",
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
            const SizedBox(height: 10),
            const Text(
              "Step 2 of 4",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 12),

            // 1. Stepper UI
            const CampaignStepper(currentStep: 2),

            const SizedBox(height: 24),

            // 2. Minimum Followers
            const CampaignFieldLabel(label: "Minimum Followers"),
            const CampaignTextField(hint: "E.g 10,000"),

            const SizedBox(height: 20),

            // 3. Number of Influencer
            const CampaignFieldLabel(label: "Number of Influencer"),
            const CampaignCounterField(),

            const SizedBox(height: 20),

            // 4. Deliverable by Influencer
            const CampaignFieldLabel(label: "Deliverable by Influencer"),
            const CampaignDeliverablesSection(),

            const SizedBox(height: 20),

            // 5. Budget per Influencer
            const CampaignFieldLabel(label: "Budget per Influencer"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black.withOpacity(0.1)),
              ),
              child: Row(
                children: const [
                  Text(
                    "₹",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Amount",
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 15,
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

            const SizedBox(height: 8),
            const Text(
              "Total Budget: ₹",
              style: TextStyle(fontSize: 13, color: Colors.black45),
            ),

            const SizedBox(height: 40),

            // 6. Next Button
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
                onPressed: () => Get.to(() => const Targeting()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
