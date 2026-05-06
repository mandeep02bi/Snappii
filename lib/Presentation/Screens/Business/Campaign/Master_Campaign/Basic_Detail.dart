import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Influencer.dart';
import 'package:snappis/Presentation/Widgets/App_textField.dart';
import 'package:snappis/Presentation/Widgets/Drop_down.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class BasicDetail extends StatefulWidget {
  const BasicDetail({super.key});

  @override
  State<BasicDetail> createState() => _BasicDetailState();
}

class _BasicDetailState extends State<BasicDetail> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Back + title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "Basic Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              /// Step
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Step 1/4",
                  style: TextStyle(color: AppColors.muted),
                ),
              ),

              const SizedBox(height: 20),

              /// Campaign Name
              const Text("Campaign Name"),
              const SizedBox(height: 6),
              const AppTextField(hint: "Enter Name"),

              const SizedBox(height: 16),

              /// Category
              const Text("Influencer Category"),
              const SizedBox(height: 6),
              const DropdownField(hint: "Select Category"),

              const SizedBox(height: 16),

              /// Deadline
              const Text("Deadline"),
              const SizedBox(height: 6),
              const AppTextField(hint: ""),

              const SizedBox(height: 30),

              /// Button
              SecprimarBtn(
                text: "Continuous",
                onPressed: () {
                     Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const Influencer(),
                            ),
                          ); 
                  // Navigate to Step 2
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}