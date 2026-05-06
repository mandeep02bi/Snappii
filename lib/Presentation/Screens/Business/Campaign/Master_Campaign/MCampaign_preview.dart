import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Publish_campaign.dart';
import 'package:snappis/Presentation/Widgets/Info_row.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';
import 'package:snappis/Presentation/Widgets/Section_card.dart';

class McampaignPreview extends StatefulWidget {
  const McampaignPreview({super.key});

  @override
  State<McampaignPreview> createState() => _McampaignPreviewState();
}

class _McampaignPreviewState extends State<McampaignPreview> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                  const Text(
                    "Preview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// Banner
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/banner.jpg",
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 10),

              const Text("Clothes Shop",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const Text("Budget per influencer   1000"),
              const Text("Deadline   5 days"),

              const SizedBox(height: 16),

              /// Influencer Requirement
              SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Influencer requirment",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          
                          child: SizedBox(
                              width: double.infinity,

                            child: SectionCard(
                              child: const Column(
                                children: [
                                  Text("Reel 1"),
                                  Text("Story 1"),
                                  Text("Post 1"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                              width: double.infinity,

                            child: SectionCard(
                              child: const Column(
                                children: [
                                  Text("Followers\n100K",
                                      textAlign: TextAlign.center),
                                  SizedBox(height: 6),
                                  Text("Gender : Female"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const InfoRow(
                        title: "Influencer required", value: "0/100"),
                    const InfoRow(title: "Age", value: "18-25"),
                    const InfoRow(
                        title: "Influencer category", value: "Lifestyle"),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// About
              const Text("About Campaign",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              const Text(
                "Artificial Intelligence (AI) is technology enabling machines "
                "to mimic human intelligence, learning from data to reason, "
                "solve problems.",
                style: TextStyle(color: AppColors.muted),
              ),

              const SizedBox(height: 20),

Row(
  children: [
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: SecprimarBtn(
        text: "Edit",
        outlined: true,
        onPressed: () {},
      ),
    ),
    const SizedBox(width: 12),
    SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: SecprimarBtn(
        text: "Publish",
        onPressed: () {

            Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const PublishCampaign(),
                            ),
                          ); 
        },
      ),
    ),
  ],
),
              const SizedBox(height: 20),

              /// Buttons
            // Row(
            //   children: [
            //     Expanded(
            //       child: SecprimarBtn(
            //         text: "Edit",
            //         outlined: true,
            //         onPressed: () {},
            //       ),
            //     ),
            //     const SizedBox(width: 12),
            //     Expanded(
            //       child: SecprimarBtn(
            //         text: "Publish",
            //         onPressed: () {},
            //       ),
            //     ),
            //   ],
            // ),

            ],
          ),
        ),
      ),
    );
  }
}