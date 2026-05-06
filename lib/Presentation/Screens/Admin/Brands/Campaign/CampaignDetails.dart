import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Widgets/Admin/Counter_widget.dart';
import 'package:snappis/Presentation/Widgets/Admin/Upload_image.dart';
import 'package:snappis/Presentation/Widgets/Admin/app_card.dart';
import 'package:snappis/Presentation/bloc/CampaignBloc.dart';
import 'package:flutter/services.dart';


class Campaigndetails extends StatefulWidget {
  const Campaigndetails({super.key});

  @override
  State<Campaigndetails> createState() => _CampaigndetailsState();
}

class _CampaigndetailsState extends State<Campaigndetails> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CampaignBloc(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Row(
          children: [
            /// Sidebar (simplified)
            Container(
              width: 240,
              color: AppColors.white,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Brand Campaign",
                    style: TextStyle(
                        fontWeight: FontWeight.bold)),
              ),
            ),

            /// Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Campaign Applicants",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold),
                      ),

                      const SizedBox(height: 20),

                      AppCard(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          /// LEFT SECTION
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                /// Campaign Name
                                const Text("Campaign Name"),
                                const SizedBox(height: 8),
                                TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                /// Select Category
                                const Text("Select Category"),
                                const SizedBox(height: 8),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: "Amount",
                                        child: Text("Amount")),
                                  ],
                                  onChanged: (_) {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                /// Deadline
                                const Text("Deadline"),
                                const SizedBox(height: 8),
                                TextField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 20),

                                /// Targeting Details
                                const Text("Targeting Details (Gender, Country)"),

                                const SizedBox(height: 12),

                                /// Gender Counter
                                Row(
                                  children: [
                                    const Text("Gender"),
                                    const SizedBox(width: 20),
                                    CounterWidget(
                                      value: 0,
                                      onAdd: () {},
                                      onRemove: () {},
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                /// Post Counter
                                Row(
                                  children: [
                                    const Text("Post"),
                                    const SizedBox(width: 20),
                                    CounterWidget(
                                      value: 0,
                                      onAdd: () {},
                                      onRemove: () {},
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),

                                /// Deliverables
                                const Text("Deliverables (Post)"),

                                const SizedBox(height: 12),

                                CounterWidget(
                                  value: 0,
                                  onAdd: () {},
                                  onRemove: () {},
                                ),

                                const SizedBox(height: 20),

                                /// Total Budget
                                const Text("Total Budget ₹ (0-Tax)"),

                                const SizedBox(height: 12),

                                CounterWidget(
                                  value: 0,
                                  onAdd: () {},
                                  onRemove: () {},
                                ),

                                const SizedBox(height: 30),

                                /// Buttons
                                Row(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.green,
                                      ),
                                      onPressed: () {},
                                      child: const Text("Approve Campaign"),
                                    ),
                                    const SizedBox(width: 16),
                                    OutlinedButton(
                                      onPressed: () {},
                                      child: const Text("Decline Campaign"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 30),

                          /// RIGHT SECTION
                          const Expanded(
                            child: UploadImageCard(),
                          ),
                        ],
                      ),
                    )

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}