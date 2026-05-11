import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/MCampaign_preview.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_upload_card.dart';

class CampaignDetailing extends StatelessWidget {
  const CampaignDetailing({super.key});

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
          "Targeting", // As per UI image
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
              "Step 1 of 4", // As per UI image (even though it's step 4)
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 12),

            // 1. Stepper UI
            const CampaignStepper(currentStep: 4),

            const SizedBox(height: 24),

            // 2. Upload Cards
            const CampaignUploadCard(
              title: "Upload Campaign Image",
              recommendedText: "Recomaneded: Portrait\n(2:3 ratio),JPG/PNG",
            ),

            const CampaignUploadCard(title: "Upload Sample Video"),

            const SizedBox(height: 20),

            // 3. Save as Draft Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE1D0FF), width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Save as Draft",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 4. Preview & Publish Button
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
                onPressed: () => Get.to(() => const McampaignPreview()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Preview & Publish",
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
