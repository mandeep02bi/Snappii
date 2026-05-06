import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/controllers/BookingFormcontroller.dart';
import 'package:snappis/Presentation/Screens/Business/Book_service/Final_book_service.dart';
import 'package:snappis/Presentation/Widgets/Campaign_card.dart';
import 'package:snappis/Presentation/Widgets/Creator_header.dart';
import 'package:snappis/Presentation/bloc/booking_bloc.dart';

class CampaignPreview extends StatefulWidget {
  bool isEditing;
  CampaignPreview({super.key, required this.isEditing});

  @override
  State<CampaignPreview> createState() => _CampaignPreviewState();
}

class _CampaignPreviewState extends State<CampaignPreview> {

  final formController = Get.find<BookingFormController>();
 
  @override
  Widget build(BuildContext context) {
    print("Preview Bloc: ${context.read<BookingBloc>().hashCode}");
    return Scaffold(
      backgroundColor: AppColors.bg1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back + title
              Row(
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 12),
                  Text(
                    "Preview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // CreatorHeader(),
              Obx(() => CreatorHeader(
                name: formController.creatorName.value,
                username: formController.userName.value,
                imageUrl: formController.creatorImage.value,
                followers: formController.creatorFollowers.value,
              )),

              const SizedBox(height: 16),

              CampaignCard(campaignname: formController.campaignName.value,),

              const Spacer(),

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
                    
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const FinalBookService(),
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