import 'package:flutter/material.dart';

class EmptyCampaignState extends StatelessWidget {
  const EmptyCampaignState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Campaign Available",
        style: TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
