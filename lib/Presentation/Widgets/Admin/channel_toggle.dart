import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class ChannelToggle extends StatelessWidget {
  const ChannelToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _item("Slack", true),
          _item("Twilio", false),
        ],
      ),
    );
  }

  Widget _item(String label, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: active ? AppColors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
