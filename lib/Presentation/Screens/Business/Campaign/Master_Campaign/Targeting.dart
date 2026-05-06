import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Campaign_detailing.dart';
import 'package:snappis/Presentation/Widgets/App_textField.dart';
import 'package:snappis/Presentation/Widgets/Drop_down.dart';
import 'package:snappis/Presentation/Widgets/Range_field.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class Targeting extends StatefulWidget {
  const Targeting({super.key});

  @override
  State<Targeting> createState() => _TargetingState();
}

class _TargetingState extends State<Targeting> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                    "Targeting",
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
                child: Text("Step 3/4"),
              ),

              const SizedBox(height: 20),

              const Text("Campaign description"),
              const SizedBox(height: 6),
              const AppTextField(
                hint: "Enter your description",
                maxLines: 4,
              ),

              const SizedBox(height: 16),

              const Text("Gender"),
              const SizedBox(height: 6),
              const DropdownField(hint: "Choose gender"),

              const SizedBox(height: 16),

              const Text("Age"),
              const SizedBox(height: 6),
              Row(
                children: const [
                  RangeField(value: "18"),
                  SizedBox(width: 12),
                  RangeField(value: "35"),
                ],
              ),

              const SizedBox(height: 16),

              const Text("Country"),
              const SizedBox(height: 6),
              const DropdownField(hint: "India"),

              const SizedBox(height: 16),

              const Text("State"),
              const SizedBox(height: 6),
              const DropdownField(hint: "Delhi"),

              const SizedBox(height: 16),

              const Text("City"),
              const SizedBox(height: 6),
              const DropdownField(hint: "Banglore"),

              const SizedBox(height: 30),

              SecprimarBtn(
                text: "Continuous",
                onPressed: () {
                   Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CampaignDetailing(),
                            ),
                          ); 
                  // Navigate to Step 4/4
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}