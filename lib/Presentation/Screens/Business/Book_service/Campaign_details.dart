import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Presentation/Screens/Business/Book_service/Campaign_prom_detail.dart';
import 'package:snappis/Presentation/Widgets/App_textField.dart';

class CampaignDetails extends StatefulWidget {
    final List<ServiceEntity1> services;
  final int totalAmount;
  const CampaignDetails({super.key, required this.services,
    required this.totalAmount,});

  @override
  State<CampaignDetails> createState() => _CampaignDetailsState();
}

class _CampaignDetailsState extends State<CampaignDetails> {

  final campaignNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final deadlineController = TextEditingController();
  final formController = Get.put(BookingFormController());

  @override
  void dispose() {
    campaignNameController.dispose();
    descriptionController.dispose();
    deadlineController.dispose();
    super.dispose();
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back + Step
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 12),
                  Text(
                    "Step 2/4",
                    style: TextStyle(color: AppColors.label),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Title
              const Text(
                "Campaign Details",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 20),

              /// Campaign Name
              const Text("Campaign Name"),
              const SizedBox(height: 6),
              AppTextField(hint: "Clothes Shop", controller: campaignNameController,),

              const SizedBox(height: 16),

              /// Description
              const Text("Campaign description"),
              const SizedBox(height: 6),
              AppTextField(
                hint: "",
                maxLines: 4,
                controller: descriptionController,
              ),

              const SizedBox(height: 16),

              /// Deadline
              const Text("Deadline"),
              const SizedBox(height: 6),
              AppTextField(hint: "",
              keyboardType: TextInputType.number,
              textInput: [FilteringTextInputFormatter.digitsOnly],
              controller: deadlineController,
              ),

              const SizedBox(height: 16),

              /// Upload demo
              const Text("Upload demo (Optional)"),
              const SizedBox(height: 6),
              // const UploadField(),
              Obx(() => GestureDetector(
                onTap: () {
                  if (kIsWeb) {
                       formController.pickFileWeb();
                      } else {
                         formController.pickFileMobile();
                      }
                 
                  formController.pickFileWeb();
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    formController.uploadedFileName.value.isEmpty
                        ? "Choose File"
                        : formController.uploadedFileName.value,
                  ),
                ),
              )),

              SizedBox(height: 28),

              /// Button
             
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    formController.setCampaignDetails(
                      name: campaignNameController.text,
                      desc: descriptionController.text,
                      deadlineDate: deadlineController.text,
                      imagePath: formController.uploadedFilePath.value,
                    );
                    formController.setCampaignName(campaignNameController.text);
                    formController.description.value = descriptionController.text;
                    formController.deadline.value = deadlineController.text;

             
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CampaignPromDetail(),
                            ),
                          ); 
                  },
                  child: const Text("Next",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}