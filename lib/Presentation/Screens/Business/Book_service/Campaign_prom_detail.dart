import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Domains/controllers/authcontroller.dart';
import 'package:snappis/Presentation/Screens/Business/Book_service/Campaign_preview.dart';
import 'package:snappis/Presentation/Widgets/App_textField.dart';
import 'package:snappis/Presentation/Widgets/Upload_field.dart';

class CampaignPromDetail extends StatefulWidget {
  const CampaignPromDetail({super.key});

  @override
  State<CampaignPromDetail> createState() => _CampaignPromDetailState();
}

class _CampaignPromDetailState extends State<CampaignPromDetail> {

final authController = Get.find<AuthController>();
  final nameController = TextEditingController();
final emailController = TextEditingController();
final whatsappController = TextEditingController();
final pancardController = TextEditingController();
bool isEditing = true;

final formController = Get.find<BookingFormController>();
@override
void initState() {
  super.initState();

  final user = authController.user.value;

  if (user != null) {
    nameController.text = user.firstName + user.lastName ;
    emailController.text = user.email ;
    whatsappController.text = user.mobileNumber ;
  }
}

@override
void dispose() {
  nameController.dispose();
  emailController.dispose();
  whatsappController.dispose();
  pancardController.dispose();
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back),
                                    SizedBox(width: 12),

                  Text(
                    "Step 3/3",
                    style: TextStyle(color: AppColors.label),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// Title
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  const Text(
                    "Your Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                   TextButton(
                    onPressed: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: const Text("Edit"),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// Name
              const Text("Your Name"),
              const SizedBox(height: 6),
               AppTextField(hint: "",
              controller:nameController,
              readOnly: isEditing,),

              const SizedBox(height: 16),

              /// Email
              const Text("Email id"),
              const SizedBox(height: 6),
              AppTextField(
                hint: "",
                controller: emailController,
                readOnly: isEditing,
              ),

              const SizedBox(height: 16),

              /// WhatsApp
              const Text("Whatsapp No."),
              const SizedBox(height: 6),
              AppTextField(hint: "",
              controller: whatsappController,
              readOnly: isEditing,
              ),

              const SizedBox(height: 16),

              /// Pancard
              const Text("Pancard Number"),
              const SizedBox(height: 6),
              const UploadField(),

              const SizedBox(height: 28),

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
                      formController.setUserDetails(
                        name: nameController.text,
                        emailId: emailController.text,
                        whatsappNo: whatsappController.text,
                        pancardNo: pancardController.text,
                      );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CampaignPreview(isEditing: isEditing,),
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