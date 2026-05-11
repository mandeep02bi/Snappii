import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Campaign_detailing.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_field_label.dart';
import '../widgets/campaign_text_field.dart';
import '../widgets/campaign_option_card.dart';
import '../widgets/campaign_dropdown_field.dart';

class Targeting extends StatefulWidget {
  const Targeting({super.key});

  @override
  State<Targeting> createState() => _TargetingState();
}

class _TargetingState extends State<Targeting> {
  String selectedGender = "Female";
  String selectedAge = "18 - 25";

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
          "Targeting",
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
              "Step 3 of 4",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 12),
            
            // 1. Stepper UI
            const CampaignStepper(currentStep: 3),

            const SizedBox(height: 24),

            // 2. Campaign Description
            const CampaignFieldLabel(label: "Campaign Description"),
            const CampaignTextField(
              hint: "Enter your description",
              maxLines: 4,
            ),

            const SizedBox(height: 20),

            // 3. Gender
            const CampaignFieldLabel(label: "Gender"),
            Row(
              children: [
                CampaignOptionCard(
                  label: "Male",
                  isSelected: selectedGender == "Male",
                  onTap: () => setState(() => selectedGender = "Male"),
                ),
                CampaignOptionCard(
                  label: "Female",
                  isSelected: selectedGender == "Female",
                  onTap: () => setState(() => selectedGender = "Female"),
                ),
                CampaignOptionCard(
                  label: "Other",
                  isSelected: selectedGender == "Other",
                  onTap: () => setState(() => selectedGender = "Other"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 4. Age
            const CampaignFieldLabel(label: "Age"),
            Row(
              children: [
                CampaignOptionCard(
                  label: "18 - 25",
                  isSelected: selectedAge == "18 - 25",
                  onTap: () => setState(() => selectedAge = "18 - 25"),
                ),
                CampaignOptionCard(
                  label: "25 - 35",
                  isSelected: selectedAge == "25 - 35",
                  onTap: () => setState(() => selectedAge = "25 - 35"),
                ),
                CampaignOptionCard(
                  label: "Above 35",
                  isSelected: selectedAge == "Above 35",
                  onTap: () => setState(() => selectedAge = "Above 35"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 5. Do's and Dont's
            Row(
              children: [
                Expanded(
                  child: CampaignDropdownField(
                    hint: "Do's",
                    onTap: () {
                      // Selection logic for Do's
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CampaignDropdownField(
                    hint: "Dont's",
                    onTap: () {
                      // Selection logic for Dont's
                    },
                  ),
                ),
              ],
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
                onPressed: () => Get.to(() => const CampaignDetailing()),
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
