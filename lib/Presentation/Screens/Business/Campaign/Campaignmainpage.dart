import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Basic_Detail.dart';
import 'package:snappis/Presentation/Widgets/Status_grid.dart';

class Campaignmainpage extends StatefulWidget {
  const Campaignmainpage({super.key});

  @override
  State<Campaignmainpage> createState() => _CampaignmainpageState();
}

class _CampaignmainpageState extends State<Campaignmainpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            // Title
            const Text(
              "My Campaign",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // Create Campaign Button
            GestureDetector(
              onTap: () {
                                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const BasicDetail(),
                            ),
                          ); 
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Text(
                  "Create Campaign",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Status Grid
            const StatusGrid(),

            const Spacer(),

            // Empty State
            const Text(
              "No Campaign Available",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const Spacer(),
          ],
        ),
      ),

    
    );
  }
}