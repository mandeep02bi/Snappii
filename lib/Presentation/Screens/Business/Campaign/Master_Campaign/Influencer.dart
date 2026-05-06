import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Targeting.dart';
import 'package:snappis/Presentation/Widgets/App_textField.dart';
import 'package:snappis/Presentation/Widgets/Counter_textfield.dart';
import 'package:snappis/Presentation/Widgets/Deliverable_counter.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class Influencer extends StatefulWidget {
  const Influencer({super.key});

  @override
  State<Influencer> createState() => _InfluencerState();
}

class _InfluencerState extends State<Influencer> {
 
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
                  const Text(
                    "Influencer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              const Align(
                alignment: Alignment.centerRight,
                child: Text("Step 2/4"),
              ),

              const SizedBox(height: 20),

              const Text("Minimum fallowers"),
              const SizedBox(height: 6),
              const AppTextField(hint: "E.g. 10000"),

              const SizedBox(height: 16),

              const Text("Number of Influencer"),
              const SizedBox(height: 6),
              const CounterField(),

              const SizedBox(height: 16),

              const Text("Deliverables by Influencer"),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Column(
                  children: [
                    DeliverableCounter(title: "Reels"),
                    DeliverableCounter(title: "Story"),
                    DeliverableCounter(title: "Post"),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text("Budget per influencer"),
              const SizedBox(height: 6),
              const AppTextField(hint: "Amount", suffix: "₹ "),

              const SizedBox(height: 6),
              const Text(
                "Total Budget: 70 + Tax",
                style: TextStyle(fontSize: 12, color: AppColors.muted),
              ),

              const SizedBox(height: 30),

              SecprimarBtn(
                text: "Continuous",
                onPressed: () {
                    Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const Targeting(),
                            ),
                          ); 
                  // Navigate to Step 3
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}