import 'package:flutter/material.dart';

class CampaignFieldLabel extends StatelessWidget {
  final String label;

  const CampaignFieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
      ),
    );
  }
}
