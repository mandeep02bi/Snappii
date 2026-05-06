import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/MCampaign_preview.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';
import 'package:snappis/Presentation/Widgets/Upload_card.dart';

class CampaignDetailing extends StatefulWidget {
  const CampaignDetailing({super.key});

  @override
  State<CampaignDetailing> createState() => _CampaignDetailingState();
}

class _CampaignDetailingState extends State<CampaignDetailing> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg1,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Campaign Details",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary),
                  ),
                ],
              ),

              const Align(
                alignment: Alignment.centerRight,
                child: Text("Step 4/4"),
              ),

              const SizedBox(height: 20),

              /// Campaign Image
              const UploadCard(
                title: "Campaign Image",
                subtitle:
                    "Upload Campaign Image\nDrag & drop or click to browse file.",
                helper: "Recommended: Portrait (2:3 ratio), JPG/PNG",
                showHelper: true,
              ),

              const SizedBox(height: 20),

              /// Sample Video
              const UploadCard(
                title: "Sample Vedio",
                subtitle: "+\n\nPhotos & Video     External Links",
              ),

              const SizedBox(height: 30),

              /// Buttons
              SecprimarBtn(
                text: "Saves as Draft",
                outlined: true,
                onPressed: () {},
              ),

              const SizedBox(height: 14),

              SecprimarBtn(
                text: "Preview & Publish",
                onPressed: () {
                   Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const McampaignPreview(),
                            ),
                          ); 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}