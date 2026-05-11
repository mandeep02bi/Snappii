import 'package:flutter/material.dart';

class CampaignLocationSection extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CampaignLocationSection({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          const Text(
            "Creator's Location",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Text(
            "Choose your Creator's Location",
            style: TextStyle(color: Colors.black45, fontSize: 12),
          ),
          const Divider(height: 24),
          _buildRadioOption("Choose a particular state", "state"),
          _buildRadioOption("Choose a particular City", "city"),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 13, color: Colors.black54)),
        Radio<String>(
          value: value,
          groupValue: selectedValue,
          activeColor: const Color(0xFF9136F3),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
