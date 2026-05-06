import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.save, size: 18),
      label: const Text("Save Changes"),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {},
    );
  }
}
