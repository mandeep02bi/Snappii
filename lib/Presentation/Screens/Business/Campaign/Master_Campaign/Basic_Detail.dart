import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Influencer.dart';
import '../widgets/campaign_stepper.dart';
import '../widgets/campaign_field_label.dart';
import '../widgets/campaign_text_field.dart';
import '../widgets/campaign_dropdown_field.dart';
import '../widgets/campaign_location_section.dart';
import '../widgets/campaign_selection_modal.dart';
import '../widgets/campaign_date_picker_modal.dart';
import 'package:intl/intl.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({super.key});

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  String? selectedLocationType;
  String selectedCategory = "";
  String selectedDeadline = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Basic Details",
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
              "Step 1 of 4",
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 12),

            // 1. Stepper UI
            const CampaignStepper(currentStep: 1),

            const SizedBox(height: 24),

            // 2. Form Fields
            const CampaignFieldLabel(label: "Campaign Name"),
            const CampaignTextField(hint: "Enter Name"),

            const SizedBox(height: 20),

            const CampaignFieldLabel(label: "Influencer Category"),
            CampaignDropdownField(
              hint: selectedCategory.isEmpty
                  ? "Select Category"
                  : selectedCategory,
              onTap: () {
                showCampaignSelection(
                  context: context,
                  title: "Influencer Category",
                  searchHint: "Search",
                  options: ["Beauty"],
                  onSelected: (val) {
                    setState(() => selectedCategory = val);
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            const CampaignFieldLabel(label: "Deadline"),
            CampaignDropdownField(
              hint: selectedDeadline.isEmpty ? "Select Date" : selectedDeadline,
              onTap: () {
                showCampaignDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  onDateSelected: (date) {
                    setState(() {
                      selectedDeadline = DateFormat('dd MMM yyyy').format(date);
                    });
                  },
                );
              },
            ),

            const SizedBox(height: 24),

            // 3. Creator's Location Section
            CampaignLocationSection(
              selectedValue: selectedLocationType,
              onChanged: (val) {
                setState(() {
                  selectedLocationType = val;
                });

                // Show modal based on selection
                if (val == "state") {
                  showCampaignSelection(
                    context: context,
                    title: "Select State",
                    searchHint: "Search a particular State",
                    options: ["Assam"],
                    onSelected: (selected) {
                      // Handle state selection
                    },
                  );
                } else if (val == "city") {
                  showCampaignSelection(
                    context: context,
                    title: "Select City",
                    searchHint: "Search a particular City",
                    options: ["New Delhi"],
                    onSelected: (selected) {
                      // Handle city selection
                    },
                  );
                }
              },
            ),

            const SizedBox(height: 40),

            // 4. Next Button
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
                onPressed: () => Get.to(() => const Influencer()),
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
