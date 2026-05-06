import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class SendTestButton extends StatelessWidget {
  const SendTestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.send),
      label: const Text("Send Test Email"),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenLight,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
    );
  }
}
